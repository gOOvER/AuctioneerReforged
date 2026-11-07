--[[
	Auctioneer - Price Level Utility module
	Version: 2.5.6751 (SwimmingSeadragon)
	Revision: $Id: PriceLevel.lua 6751 2022-01-25 11:42:44Z none $
	URL: 

	This is an addon for World of Warcraft that adds a price level indicator
	to auctions when browsing the Auction House, so that you may readily see
	which items are bargains or overpriced at a glance.

	License:
		This program is free software; you can redistribute it and/or
		modify it under the terms of the GNU General Public License
		as published by the Free Software Foundation; either version 3
		of the License, or (at your option) any later version.

		This program is distributed in the hope that it will be useful,
		but WITHOUT ANY WARRANTY; without even the implied warranty of
		MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
		GNU General Public License for more details.

		You should have received a copy of the GNU General Public License
		along with this program(see GPL.txt); if not, see <https://www.gnu.org/licenses/>.

	Note:
		This AddOn's source code is specifically designed to work with
		World of Warcraft's interpreted AddOn system.
		You have an implicit license to use this AddOn with these facilities
		since that is its designated purpose as per:
		http://www.fsf.org/licensing/licenses/gpl-faq.html#InterpreterIncompat
--]]
if not AucAdvanced then return end

local libType, libName = "Util", "PriceLevel"
local lib,parent,private = AucAdvanced.NewModule(libType, libName)
if not lib then return end
local print,decode,_,_,replicate,empty,get,set,default,debugPrint,fill = AucAdvanced.GetModuleLocals()

local data
private.peerWorthCache = {}
private.hookedItemLists = {}

local function ApplyBarGradient(tex, orientation, r, g, b, a1, a2)
	tex:SetColorTexture(1, 1, 1, 1)
	if tex.SetGradientAlpha then
		tex:SetGradientAlpha(orientation, r, g, b, a1, r, g, b, a2)
	elseif tex.SetGradient and CreateColor then
		tex:SetGradient(orientation:upper(), CreateColor(r, g, b, a1), CreateColor(r, g, b, a2))
	else
		tex:SetColorTexture(r, g, b, math.max(a1 or 0.3, a2 or 0.3))
	end
end

lib.Processors = {
	itemtooltip = function(callbackType, ...)
		lib.ProcessTooltip(...)
	end,

	config = function(callbackType, gui)
		private.SetupConfigGui(gui)
	end,

	auctionui = function()
		private.HookRetailAH()
	end,

	listupdate = function()
		private.ListUpdate()
	end,

	scanstats = function()
		wipe(private.peerWorthCache)
		private.ListUpdate()
	end,

	iteminfoupdate = function()
		if AuctionHouseFrame and AuctionHouseFrame:IsVisible() then
			private.UpdateAllRetailLists()
		end
	end,

	configchanged = function(callbackType, setting, value, subsetting, module, base)
		if (module == "pricelevel" or base == "profile") then
			if (AuctionFrameBrowse and AuctionFrameBrowse:IsVisible()) or (AuctionHouseFrame and AuctionHouseFrame:IsVisible()) then
				private.ListUpdate()
			end
		end
	end,
}
lib.Processors.battlepettooltip = lib.Processors.itemtooltip


function lib.ProcessTooltip(tooltip, hyperlink, serverKey, quantity, decoded, additional, order)
	if not  get("util.pricelevel.single") then return end

	if not additional or not additional.buyoutPrice or not additional.minBid then return end

	local priceLevel, perItem, r,g,b = lib.CalcLevel(hyperlink, quantity, additional.minBid, additional.buyoutPrice, nil, serverKey)
	if (not priceLevel) then return end

	tooltip:AddLine(("Price Level: %d%%"):format(priceLevel), perItem, r,g,b)
end

function lib.OnLoad()
	default("util.pricelevel.colorize", true)
	default("util.pricelevel.single", true)
	default("util.pricelevel.model", "market")
	default("util.pricelevel.basis", "try")
	default("util.pricelevel.blue", 0)
	default("util.pricelevel.green", 50)
	default("util.pricelevel.yellow", 80)
	default("util.pricelevel.orange", 110)
	default("util.pricelevel.red", 135)
	default("util.pricelevel.opacity", 35)
	default("util.pricelevel.gradient", true)
	default("util.pricelevel.direction", "LEFT")

	if not get("util.pricelevel.colorize_migrated") then
		set("util.pricelevel.colorize", true)
		set("util.pricelevel.colorize_migrated", true)
	end

	set("util.pricelevel.blue", nil) -- blue is a fake slider for display only - always 0

	if AuctionHouseFrame then
		private.HookRetailAH()
	end
end

--[[ Local functions ]]--

function private.SetupConfigGui(gui)
	-- The defaults for the following settings are set in the lib.OnLoad function
	local id = gui:AddTab(libName, libType.." Modules")
	gui:MakeScrollable(id)

	gui:AddHelp(id, "what is pricelevel",
		"What is PriceLevel?",
		"PriceLevel is an Auctioneer module that analyses the current market position with regard to the calculated value of the item.\n"..
		"PriceLevel is all about determining if what Auctioneer thinks is what the rest of the market currently thinks. It's also about determining if the rest of the market is selling their stuff for crazy prices.\n"..
		"What it all comes down to is the color... PriceLevel breaks the current market down into 5 categories: |cff3296ffWay underpriced|r, |cff19ff19Fairly underpriced|r, |cffffff00Just underpriced|r, |cffff9619Reasonable|r, and |cffff0000Overpriced|r. It also has options for adding the calculated level to the tooltip and in the browse window of the Auction House.")

	gui:AddControl(id, "Header",     0,    libName.." Options")
	gui:AddControl(id, "Checkbox",   0, 1, "util.pricelevel.single", "Show the PriceLevel and unit price in the tooltips")
	gui:AddTip(id, "Enable this to display the PriceLevel information in the tooltip when you mouse over an item in your inventory")

	gui:AddHelp(id, "what is ahcolor",
		"What does changing the Auction House items' colors do?",
		"This will change the background of the items at the Auction House so that you can more easily identify bargains or overpriced items as you are browsing.")

	gui:AddControl(id, "Checkbox",   0, 1, "util.pricelevel.colorize", "Change the color of items in the Auction House")
	gui:AddTip(id, "This option changes the color of the items lines in the Auction House so that you may more easily determine whether they are over or under priced prior to purchase")
	gui:AddControl(id, "Slider",     0, 2, "util.pricelevel.opacity", 1, 100, 1, "Opacity level: %d%%")
	gui:AddTip(id, "This controls the level of opacity for the colored bars in the Auction Browse window. (if enabled)")
	gui:AddControl(id, "Checkbox",   0, 2, "util.pricelevel.gradient", "Use a gradient:")
	gui:AddTip(id, "This causes the colored bars in the Auction Browse window to be drawn with a gradient instead of a solid color (if enabled).")
	gui:AddControl(id, "Selectbox",  0, 3, {
		{"LEFT", "Left"},
		{"RIGHT", "Right"},
		{"TOP", "Top"},
		{"BOTTOM", "Bottom"},
	}, "util.pricelevel.direction")
	gui:AddTip(id, "This determines the direction that the above gradient is drawn in for the Auction Browse window (if enabled).")
	gui:AddControl(id, "Subhead",    0,    "Price valuation method:")
	gui:AddControl(id, "Selectbox",  0, 1, parent.selectorPriceModels, "util.pricelevel.model")
	gui:AddTip(id, "The pricing model that is used to work out the calculated value of items at the Auction House.")
	gui:AddControl(id, "Subhead",    0,    "Price level basis:")
	gui:AddControl(id, "Selectbox",  0, 1, {
		{"cur", "Next bid price"},
		{"buy", "Buyout only"},
		{"try", "Buyout or bid"},
	}, "util.pricelevel.basis")
	gui:AddTip(id, "Selects which price to base the PriceLevel calculation off of.")

	gui:AddHelp(id, "what is basis",
		"What is the PriceLevel basis?",
		"The Auction House has both bids and buyout values to calculate from. You can select to price the item based off either exclusively the buyout or bid, or first the buyout if it exists, and then the bid")

	gui:AddControl(id, "Subhead",    0,    "Pricing points:")
	gui:AddControl(id, "WideSlider", 0, 1, "util.pricelevel.red",    0, 500, 5, "|cffff0000Red|r price level > %d%%")
	gui:AddTip(id, "This determines the minimum level for an item to be counted as a red item.")
	gui:AddControl(id, "WideSlider", 0, 1, "util.pricelevel.orange", 0, 500, 5, "|cffff9619Orange|r price level > %d%%")
	gui:AddTip(id, "This determines the minimum level for an item to be counted as a orange item.")
	gui:AddControl(id, "WideSlider", 0, 1, "util.pricelevel.yellow", 0, 500, 5, "|cffffff00Yellow|r price level > %d%%")
	gui:AddTip(id, "This determines the minimum level for an item to be counted as a yellow item.")
	gui:AddControl(id, "WideSlider", 0, 1, "util.pricelevel.green", 0, 500, 5, "|cff19ff19Green|r price level > %d%%")
	gui:AddTip(id, "This determines the minimum level for an item to be counted as a green item.")
	gui:AddControl(id, "WideSlider", 0, 1, "util.pricelevel.blue", 0, 0, 1, "|cff3296ffBlue|r price level > %d%%")
	gui:AddTip(id, "This slider does nothing and is just here for completeness to show that blue is under green.")

	gui:AddHelp(id, "what is points",
		"What are the pricing points for?",
		"The pricing points determine the ranges for the various PriceLevel colored bands.\n"..
		"As an item's price moves up through the bands, it will change to the next color.")

	gui:AddHelp(id, "wtf blue stuck qq",
		"Why is the blue slider stuck at zero?",
		"Something has to start at zero, and blue's the one that does it. If you moved blue off zero, then what would we color stuff under blue?")

	gui:AddHelp(id, "wtf blue stuck l2code",
		"Ok, so why did you put the blue slider in then?",
		"To appease my wife... Deal. :)")

end

function lib.ResetBars()
	if AucAdvanced.IsRetailAH then
		private.ResetRetailBars()
		return
	end
	local tex
	for i=1, NUM_BROWSE_TO_DISPLAY do
		tex = _G["BrowseButton"..i.."PriceLevel"]
		if (tex) then tex:Hide() end
	end
end

function lib.SetBar(i, r,g,b, pct)

    r = r or 1;
    g = g or 1;
    b = b or 1;
	
	local tex
	local button = _G["BrowseButton"..i]
	if not button then return end
	local colorize = AucAdvanced.Settings.GetSetting("util.pricelevel.colorize")

	if (button.AddTexture) then
		tex = button.AddTexture
		if (button.Value) then
			if (pct) then
				if pct > 999 then
					button.Value:SetText(">999%")
				else
					button.Value:SetText(("%d%%"):format(pct))
				end
				if colorize then
					button.Value:SetTextColor(1,1,1)
				else
					button.Value:SetTextColor(r,g,b)
				end
			else
				button.Value:SetText("")
				button.Value:SetTextColor(1,1,1)
			end
		end
		if not colorize then
			tex:Hide()
		end
	else
		tex = _G["BrowseButton"..i.."PriceLevel"]
	end
	if not colorize then return end

	if not tex then
		tex = button:CreateTexture("BrowseButton"..i.."PriceLevel")
		tex:SetPoint("TOPLEFT")
		tex:SetPoint("BOTTOMRIGHT", 0, 5)
	end

	if (r and g and b) then
		local opacity = AucAdvanced.Settings.GetSetting("util.pricelevel.opacity")
		opacity = math.floor(tonumber(opacity) or 50) / 100
		if (opacity < 0) then opacity = 0.01
		elseif (opacity > 1) then opacity = 1 end

		local gradient = AucAdvanced.Settings.GetSetting("util.pricelevel.gradient")
		if (gradient) then
			local direction = AucAdvanced.Settings.GetSetting("util.pricelevel.direction")
			if (direction == "LEFT") then
				ApplyBarGradient(tex, "Horizontal", r,g,b, 0, opacity)
			elseif (direction == "RIGHT") then
				ApplyBarGradient(tex, "Horizontal", r,g,b, opacity, 0)
			elseif (direction == "BOTTOM") then
				ApplyBarGradient(tex, "Vertical", r,g,b, 0, opacity)
			elseif (direction == "TOP") then
				ApplyBarGradient(tex, "Vertical", r,g,b, opacity, 0)
			else
				ApplyBarGradient(tex, "Horizontal", r,g,b, 0, opacity)
			end
		else
			ApplyBarGradient(tex, "Vertical", r,g,b, opacity, opacity)
		end
		tex:Show()
	else
		tex:Hide()
	end
end

local function GetItemListRowFrames(itemList)
	local frames = {}
	if not itemList then return frames end
	local seen = {}
	local function addFrame(f)
		if type(f) == "table" and not seen[f] and f.CreateTexture and f.CreateFontString then
			seen[f] = true
			table.insert(frames, f)
		end
	end
	if itemList.ScrollBox then
		if itemList.ScrollBox.GetFrames then
			local ok, list = pcall(itemList.ScrollBox.GetFrames, itemList.ScrollBox)
			if ok and type(list) == "table" then
				for _, f in ipairs(list) do addFrame(f) end
			end
		end
		if #frames == 0 and itemList.ScrollBox.ForEachFrame then
			pcall(itemList.ScrollBox.ForEachFrame, itemList.ScrollBox, function(f) addFrame(f) end)
		end
	end
	if itemList.ScrollFrame and type(itemList.ScrollFrame.buttons) == "table" then
		for _, f in ipairs(itemList.ScrollFrame.buttons) do addFrame(f) end
	end
	if itemList.tableBuilder and type(itemList.tableBuilder.rows) == "table" then
		for _, f in ipairs(itemList.tableBuilder.rows) do addFrame(f) end
	end
	return frames
end

local function GetRowDataFromFrame(row, itemList)
	if not row then return nil end
	if type(row.rowData) == "table" then return row.rowData end
	if row.GetElementData then
		local ok, elData = pcall(row.GetElementData, row)
		if ok and type(elData) == "table" then return elData end
		if ok and type(elData) == "number" and itemList and itemList.tableBuilder and itemList.tableBuilder.GetDataProviderData then
			local ok2, d2 = pcall(itemList.tableBuilder.GetDataProviderData, itemList.tableBuilder, elData)
			if ok2 and type(d2) == "table" then return d2 end
		end
	end
	if type(row.cells) == "table" then
		for _, cell in ipairs(row.cells) do
			if cell and type(cell.rowData) == "table" then
				return cell.rowData
			end
		end
	end
	return nil
end

function private.ResetRetailBars()
	for itemList in pairs(private.hookedItemLists) do
		local rows = GetItemListRowFrames(itemList)
		for _, row in ipairs(rows) do
			if row._aucPriceLevelTex then row._aucPriceLevelTex:Hide() end
			if row._aucPriceLevelText then row._aucPriceLevelText:SetText("") end
		end
	end
end

function private.SetRetailRowBar(row, r, g, b, pct)
	if not row then return end
	if not row._aucPriceLevelTex then
		local tex = row:CreateTexture(nil, "BORDER", nil, 2)
		tex:SetPoint("TOPLEFT", row, "TOPLEFT", 2, -1)
		tex:SetPoint("BOTTOMRIGHT", row, "BOTTOMRIGHT", -2, 1)
		tex:Hide()
		row._aucPriceLevelTex = tex
	end
	if not row._aucPriceLevelOverlay then
		local overlay = CreateFrame("Frame", nil, row)
		overlay:SetAllPoints(row)
		overlay:SetFrameLevel((row:GetFrameLevel() or 1) + 5)
		local txt = overlay:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
		txt:SetPoint("RIGHT", overlay, "RIGHT", -8, 0)
		txt:SetJustifyH("RIGHT")
		row._aucPriceLevelOverlay = overlay
		row._aucPriceLevelText = txt
	end

	local txt = row._aucPriceLevelText
	local tex = row._aucPriceLevelTex
	local offset = (AucAdvanced and AucAdvanced.GetFontSizeOffset and AucAdvanced.GetFontSizeOffset()) or 0
	local fontPath = (STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF")
	pcall(txt.SetFont, txt, fontPath, math.max(9, 12 + offset), "OUTLINE")

	if not pct or not r or not g or not b then
		txt:SetText("")
		tex:Hide()
		return
	end

	local roundedPct = math.floor(pct + 0.5)
	if roundedPct > 999 then
		txt:SetText(">999%")
	else
		txt:SetText(("%d%%"):format(roundedPct))
	end

	-- Use a bright tint of the level color so the percentage is always vivid and easy to read
	local tr = math.min(1, r * 0.8 + 0.25)
	local tg = math.min(1, g * 0.8 + 0.25)
	local tb = math.min(1, b * 0.8 + 0.25)
	txt:SetTextColor(tr, tg, tb, 1)
	txt:Show()

	local colorize = AucAdvanced.Settings.GetSetting("util.pricelevel.colorize")
	if not colorize then
		tex:Hide()
		return
	end

	local opacity = AucAdvanced.Settings.GetSetting("util.pricelevel.opacity")
	opacity = math.floor(tonumber(opacity) or 35) / 100
	if opacity < 0.05 then opacity = 0.05
	elseif opacity > 1 then opacity = 1 end

	local gradient = AucAdvanced.Settings.GetSetting("util.pricelevel.gradient")
	if gradient then
		local direction = AucAdvanced.Settings.GetSetting("util.pricelevel.direction")
		if direction == "LEFT" then
			ApplyBarGradient(tex, "Horizontal", r, g, b, opacity * 0.25, opacity)
		elseif direction == "RIGHT" then
			ApplyBarGradient(tex, "Horizontal", r, g, b, opacity, opacity * 0.25)
		elseif direction == "BOTTOM" then
			ApplyBarGradient(tex, "Vertical", r, g, b, opacity * 0.25, opacity)
		elseif direction == "TOP" then
			ApplyBarGradient(tex, "Vertical", r, g, b, opacity, opacity * 0.25)
		else
			ApplyBarGradient(tex, "Horizontal", r, g, b, opacity * 0.25, opacity)
		end
	else
		ApplyBarGradient(tex, "Vertical", r, g, b, opacity, opacity)
	end
	tex:Show()
end

local function ComputeTrimmedMean(values)
	local n = #values
	if n == 0 then return nil end
	if n == 1 then return values[1] end
	table.sort(values)
	local startIdx = math.max(1, math.floor(n * 0.15) + 1)
	local endIdx = math.min(n, math.ceil(n * 0.85))
	if endIdx < startIdx then
		startIdx, endIdx = 1, n
	end
	local sum, count = 0, 0
	for i = startIdx, endIdx do
		sum = sum + values[i]
		count = count + 1
	end
	return count > 0 and (sum / count) or values[math.ceil(n / 2)]
end

function private.GetRetailFallbackWorth(link, itemID, rowData, itemList)
	-- 1. Check if we are in ItemBuyFrame or CommoditiesBuyFrame (all rows are the same item)
	if itemList and AuctionHouseFrame then
		if (AuctionHouseFrame.ItemBuyFrame and itemList == AuctionHouseFrame.ItemBuyFrame.ItemList)
		or (AuctionHouseFrame.CommoditiesBuyFrame and itemList == AuctionHouseFrame.CommoditiesBuyFrame.ItemList) then
			local cacheKey = "search:" .. tostring(itemID or link or "current")
			if private.peerWorthCache[cacheKey] then
				return private.peerWorthCache[cacheKey]
			end
			local unitPrices = {}
			local rows = GetItemListRowFrames(itemList)
			for _, rFrame in ipairs(rows) do
				local rData = GetRowDataFromFrame(rFrame, itemList)
				if rData then
					local qty = (rData.quantity and rData.quantity > 0) and rData.quantity or 1
					local p = rData.unitPrice or (rData.buyoutAmount and rData.buyoutAmount > 0 and (rData.buyoutAmount / qty)) or (rData.bidAmount and rData.bidAmount > 0 and (rData.bidAmount / qty))
					if p and p > 0 then
						table.insert(unitPrices, p)
					end
				end
			end
			local avg = ComputeTrimmedMean(unitPrices)
			if avg and avg > 0 then
				private.peerWorthCache[cacheKey] = avg
				return avg
			end
		end
	end

	-- 2. In BrowseResultsFrame: compute peer baseline across current browse results
	local browseStats = private.peerWorthCache._browseStats
	if not browseStats then
		local prices = {}
		local perIlvl = {}
		local results = (C_AuctionHouse and C_AuctionHouse.GetBrowseResults and C_AuctionHouse.GetBrowseResults()) or nil
		if type(results) == "table" and #results > 0 then
			for _, entry in ipairs(results) do
				local minP = entry and entry.minPrice
				if minP and minP > 0 then
					table.insert(prices, minP)
					local ilvl = entry.itemKey and entry.itemKey.itemLevel
					if ilvl and ilvl > 1 then
						table.insert(perIlvl, minP / ilvl)
					end
				end
			end
		elseif itemList then
			local rows = GetItemListRowFrames(itemList)
			for _, rFrame in ipairs(rows) do
				local rData = GetRowDataFromFrame(rFrame, itemList)
				local minP = rData and rData.minPrice
				if minP and minP > 0 then
					table.insert(prices, minP)
					local ilvl = rData.itemKey and rData.itemKey.itemLevel
					if ilvl and ilvl > 1 then
						table.insert(perIlvl, minP / ilvl)
					end
				end
			end
		end
		browseStats = {
			meanPrice = ComputeTrimmedMean(prices),
			meanPerIlvl = (#perIlvl >= 3) and ComputeTrimmedMean(perIlvl) or nil,
		}
		private.peerWorthCache._browseStats = browseStats
	end

	local rowIlvl = (rowData and rowData.itemKey and rowData.itemKey.itemLevel) or nil
	if (not rowIlvl or rowIlvl <= 1) and (itemID or link) then
		local _, _, _, ilvl = GetItemInfo(itemID or link)
		if ilvl and ilvl > 1 then rowIlvl = ilvl end
	end
	if browseStats.meanPerIlvl and rowIlvl and rowIlvl > 1 then
		return browseStats.meanPerIlvl * rowIlvl
	end
	if browseStats.meanPrice and browseStats.meanPrice > 0 then
		return browseStats.meanPrice
	end

	-- 3. Last resort: vendor sell price * 4
	if itemID or link then
		local vendorPrice = select(11, GetItemInfo(itemID or link))
		if vendorPrice and vendorPrice > 0 then
			return vendorPrice * 4
		end
	end
	return nil
end

function private.UpdateRetailRow(row, itemList)
	if not row then return end
	if not row:IsShown() then
		private.SetRetailRowBar(row, nil, nil, nil, nil)
		return
	end
	local rowData = GetRowDataFromFrame(row, itemList)
	if not rowData then
		private.SetRetailRowBar(row, nil, nil, nil, nil)
		return
	end

	local quantity, bidPrice, buyPrice
	if rowData.minPrice and rowData.minPrice > 0 then
		quantity = 1
		buyPrice = rowData.minPrice
		bidPrice = rowData.minPrice
	elseif rowData.unitPrice and rowData.unitPrice > 0 then
		quantity = 1
		buyPrice = rowData.unitPrice
		bidPrice = rowData.unitPrice
	else
		quantity = (rowData.quantity and rowData.quantity > 0) and rowData.quantity or 1
		buyPrice = rowData.buyoutAmount or 0
		bidPrice = rowData.bidAmount or rowData.minBid or buyPrice or 0
	end

	if (not buyPrice or buyPrice <= 0) and (not bidPrice or bidPrice <= 0) then
		private.SetRetailRowBar(row, nil, nil, nil, nil)
		return
	end

	local itemID = rowData.itemID or (rowData.itemKey and rowData.itemKey.itemID)
	if not itemID and AuctionHouseFrame and AuctionHouseFrame.CommoditiesBuyFrame and itemList == AuctionHouseFrame.CommoditiesBuyFrame.ItemList then
		itemID = AuctionHouseFrame.CommoditiesBuyFrame.itemID
			or (AuctionHouseFrame.CommoditiesBuyFrame.BuyDisplay and AuctionHouseFrame.CommoditiesBuyFrame.BuyDisplay.itemID)
	end

	local link = rowData.itemLink
	if not link and itemID then
		local _, infoLink = GetItemInfo(itemID)
		link = infoLink or rowData.appearanceLink
		if not link then
			if C_Item and C_Item.RequestLoadItemDataByID then
				pcall(C_Item.RequestLoadItemDataByID, itemID)
			end
			local suffix = (rowData.itemKey and rowData.itemKey.itemSuffix) or 0
			link = ("|cffffffff|Hitem:%d:0:0:0:0:0:%d:0:0|h[item:%d]|h|r"):format(itemID, suffix, itemID)
		end
	end

	if not link then
		private.SetRetailRowBar(row, nil, nil, nil, nil)
		return
	end

	local priceLevel, _, r, g, b = lib.CalcLevel(link, quantity, bidPrice, buyPrice)
	if not priceLevel then
		local fallbackWorth = private.GetRetailFallbackWorth(link, itemID, rowData, itemList)
		if fallbackWorth and fallbackWorth > 0 then
			priceLevel, _, r, g, b = lib.CalcLevel(link, quantity, bidPrice, buyPrice, fallbackWorth)
		end
	end

	private.SetRetailRowBar(row, r, g, b, priceLevel)
end

function private.UpdateRetailItemList(itemList)
	if not itemList or not itemList:IsVisible() then return end
	if itemList.HeaderContainer and not itemList.HeaderContainer._aucPctHeader then
		local hdr = itemList.HeaderContainer:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
		hdr:SetPoint("RIGHT", itemList.HeaderContainer, "RIGHT", -12, 0)
		hdr:SetText("%")
		hdr:SetTextColor(1, 0.82, 0, 0.9)
		itemList.HeaderContainer._aucPctHeader = hdr
	end
	local rows = GetItemListRowFrames(itemList)
	for _, row in ipairs(rows) do
		private.UpdateRetailRow(row, itemList)
	end
end

function private.UpdateAllRetailLists()
	for itemList in pairs(private.hookedItemLists) do
		if itemList:IsVisible() then
			private.UpdateRetailItemList(itemList)
		end
	end
end

local function HookSingleRetailItemList(itemList)
	if not itemList or private.hookedItemLists[itemList] then return end
	private.hookedItemLists[itemList] = true

	if itemList.RefreshScrollFrame then
		hooksecurefunc(itemList, "RefreshScrollFrame", function(self)
			private.UpdateRetailItemList(self)
		end)
	end
	if itemList.UpdateTable then
		hooksecurefunc(itemList, "UpdateTable", function(self)
			private.UpdateRetailItemList(self)
		end)
	end
	if itemList.DirtyScrollFrame then
		hooksecurefunc(itemList, "DirtyScrollFrame", function(self)
			private.UpdateRetailItemList(self)
		end)
	end
	if itemList.ScrollBox then
		if itemList.ScrollBox.Update then
			hooksecurefunc(itemList.ScrollBox, "Update", function()
				private.UpdateRetailItemList(itemList)
			end)
		end
		if ScrollBoxListMixin and ScrollBoxListMixin.Event and ScrollBoxListMixin.Event.OnDataRangeChanged and itemList.ScrollBox.RegisterCallback then
			pcall(itemList.ScrollBox.RegisterCallback, itemList.ScrollBox, ScrollBoxListMixin.Event.OnDataRangeChanged, function()
				private.UpdateRetailItemList(itemList)
			end, private)
		end
	end
	if itemList.ScrollFrame then
		itemList.ScrollFrame:HookScript("OnVerticalScroll", function()
			private.UpdateRetailItemList(itemList)
		end)
		if type(itemList.ScrollFrame.update) == "function" then
			hooksecurefunc(itemList.ScrollFrame, "update", function()
				private.UpdateRetailItemList(itemList)
			end)
		end
	end
	if itemList.tableBuilder then
		if itemList.tableBuilder.Populate then
			hooksecurefunc(itemList.tableBuilder, "Populate", function()
				private.UpdateRetailItemList(itemList)
			end)
		end
		if itemList.tableBuilder.AddRow then
			hooksecurefunc(itemList.tableBuilder, "AddRow", function(_, row)
				private.UpdateRetailRow(row, itemList)
			end)
		end
		if itemList.tableBuilder.Arrange then
			hooksecurefunc(itemList.tableBuilder, "Arrange", function()
				private.UpdateRetailItemList(itemList)
			end)
		end
	end
	itemList:HookScript("OnShow", function(self)
		private.UpdateRetailItemList(self)
	end)
end

function private.HookRetailAH()
	if not AuctionHouseFrame then return end
	if AuctionHouseFrame.BrowseResultsFrame and AuctionHouseFrame.BrowseResultsFrame.ItemList then
		HookSingleRetailItemList(AuctionHouseFrame.BrowseResultsFrame.ItemList)
	end
	if AuctionHouseFrame.ItemBuyFrame and AuctionHouseFrame.ItemBuyFrame.ItemList then
		HookSingleRetailItemList(AuctionHouseFrame.ItemBuyFrame.ItemList)
	end
	if AuctionHouseFrame.CommoditiesBuyFrame and AuctionHouseFrame.CommoditiesBuyFrame.ItemList then
		HookSingleRetailItemList(AuctionHouseFrame.CommoditiesBuyFrame.ItemList)
	end

	if not private.retailEventFrame then
		local ef = CreateFrame("Frame")
		ef:RegisterEvent("AUCTION_HOUSE_BROWSE_RESULTS_UPDATED")
		ef:RegisterEvent("AUCTION_HOUSE_BROWSE_RESULTS_ADDED")
		ef:RegisterEvent("ITEM_SEARCH_RESULTS_UPDATED")
		ef:RegisterEvent("ITEM_SEARCH_RESULTS_ADDED")
		ef:RegisterEvent("COMMODITY_SEARCH_RESULTS_UPDATED")
		local pendingDelay = nil
		ef:SetScript("OnEvent", function()
			wipe(private.peerWorthCache)
			private.UpdateAllRetailLists()
			pendingDelay = 0.08
		end)
		ef:SetScript("OnUpdate", function(_, elapsed)
			if not pendingDelay then return end
			pendingDelay = pendingDelay - elapsed
			if pendingDelay <= 0 then
				pendingDelay = nil
				private.UpdateAllRetailLists()
			end
		end)
		private.retailEventFrame = ef
	end

	if AucAdvanced and AucAdvanced.ApplyAllFonts and not private.hookedApplyAllFonts then
		private.hookedApplyAllFonts = true
		hooksecurefunc(AucAdvanced, "ApplyAllFonts", function()
			private.UpdateAllRetailLists()
		end)
	end

	private.UpdateAllRetailLists()
end

function private.ListUpdate()
	if AucAdvanced.IsRetailAH then
		wipe(private.peerWorthCache)
		private.HookRetailAH()
		private.UpdateAllRetailLists()
		return
	end
	lib.ResetBars()
	local index, link, quantity, minBid, minInc, buyPrice, bidPrice, priceLevel, perItem, r,g,b, _
	local numBatchAuctions, totalAuctions = GetNumAuctionItems("list");
	local offset = FauxScrollFrame_GetOffset(BrowseScrollFrame)

	for i=1, NUM_BROWSE_TO_DISPLAY do
		index = offset + i + (NUM_AUCTION_ITEMS_PER_PAGE * AuctionFrameBrowse.page);
		if (index <= numBatchAuctions + (NUM_AUCTION_ITEMS_PER_PAGE * AuctionFrameBrowse.page)) then
			if AucAdvanced.Modules.Util.CompactUI
			and AucAdvanced.Modules.Util.CompactUI.inUse then
				_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,
				priceLevel,_,r,g,b = AucAdvanced.Modules.Util.CompactUI.GetContents(offset+i)
				lib.SetBar(i, r,g,b, priceLevel)
			else
				link =  GetAuctionItemLink("list", offset + i)
				if link then
					_,_, quantity, _,_,_,_, minBid, minInc, buyPrice, bidPrice = GetAuctionItemInfo("list", offset + i)
					if bidPrice>0 then
						bidPrice = bidPrice + minInc
						if buyPrice > 0 and bidPrice > buyPrice then
							bidPrice = buyPrice
						end
					elseif minBid > 0 then
						bidPrice = minBid
					else
						bidPrice = 1
					end
					priceLevel, perItem, r,g,b = lib.CalcLevel(link, quantity, bidPrice, buyPrice)
					lib.SetBar(i, r,g,b, priceLevel)
				end
			end
		end
	end
end

function lib.CalcLevel(link, quantity, bidPrice, buyPrice, itemWorth, serverKey)
	if not quantity or quantity < 1 then quantity = 1 end

	local priceBasis = get("util.pricelevel.basis")

	local stackPrice
	if (priceBasis == "cur") then
		stackPrice = bidPrice
	elseif (priceBasis == "buy") then
		if not buyPrice or buyPrice <= 0 then return end
		stackPrice = buyPrice
	elseif (priceBasis == "try") then
		stackPrice = buyPrice or 0
		if stackPrice <= 0 then
			stackPrice = bidPrice
		end
	end
	if not stackPrice then return end

	if not itemWorth then
		local priceModel = get("util.pricelevel.model")
		if (priceModel == "market") then
			itemWorth = AucAdvanced.API.GetMarketValue(link, serverKey)
		else
			itemWorth = AucAdvanced.API.GetAlgorithmValue(priceModel, link, serverKey)
		end
		if not itemWorth then return end
	end
	if itemWorth < 1 then return end -- avoid 0 or very small itemWorth

	local perItem = stackPrice / quantity
	local priceLevel = perItem / itemWorth * 100

	local r, g, b, lvl

    local colorBlind = GetCVar("colorblindMode") == "1"

    if colorBlind then
        r,g,b,lvl     = 0.2,0.6,1.0, "blue"
        if priceLevel > get("util.pricelevel.red") then
            r,g,b,lvl = 1.0,0.2,0.4, "red"
        elseif priceLevel > get("util.pricelevel.orange") then
            r,g,b,lvl = 1.0,0.6,0.2, "orange"
        elseif priceLevel > get("util.pricelevel.yellow") then
            r,g,b,lvl = 1.0,1.0,0.2, "yellow"
        elseif priceLevel > get("util.pricelevel.green") then
            r,g,b,lvl = 0.2,1.0,0.3, "green"
        end
    else
        r,g,b,lvl = 0.2,0.6,1.0, "blue"
        if priceLevel > get("util.pricelevel.red") then
            r,g,b,lvl = 1.0,0.0,0.0, "red"
        elseif priceLevel > get("util.pricelevel.orange") then
            r,g,b,lvl = 1.0,0.6,0.1, "orange"
        elseif priceLevel > get("util.pricelevel.yellow") then
            r,g,b,lvl = 1.0,1.0,0.0, "yellow"
        elseif priceLevel > get("util.pricelevel.green") then
            r,g,b,lvl = 0.1,1.0,0.1, "green"
        end
    end

	return priceLevel, perItem, r,g,b, lvl, itemWorth
end

AucAdvanced.RegisterRevision("$URL: Auc-Advanced/Modules/Auc-Util-PriceLevel/PriceLevel.lua $", "$Rev: 6751 $")
