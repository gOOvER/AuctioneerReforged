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
	if row.GetElementData then
		local ok, elData = pcall(row.GetElementData, row)
		if ok and type(elData) == "table" then return elData end
		if ok and type(elData) == "number" and itemList then
			local provider = itemList.getEntry or itemList.dataProvider
			if type(provider) == "function" then
				local ok2, d2 = pcall(provider, elData)
				if ok2 and type(d2) == "table" then return d2 end
			end
			if itemList.tableBuilder and itemList.tableBuilder.GetDataProviderData then
				local ok2, d2 = pcall(itemList.tableBuilder.GetDataProviderData, itemList.tableBuilder, elData)
				if ok2 and type(d2) == "table" then return d2 end
			end
		end
	end
	if type(row.dataIndex) == "number" and itemList then
		local provider = itemList.getEntry or itemList.dataProvider
		if type(provider) == "function" then
			local ok, d = pcall(provider, row.dataIndex)
			if ok and type(d) == "table" then return d end
		end
	end
	if type(row.rowData) == "table" then return row.rowData end
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

local PCT_COL_WIDTH = 56

function private.SetRetailRowBar(row, r, g, b, pct, hasPctCol)
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

		local div = overlay:CreateTexture(nil, "ARTWORK", nil, 2)
		div:SetWidth(1)
		div:SetPoint("TOPLEFT", overlay, "TOPRIGHT", -PCT_COL_WIDTH, -1)
		div:SetPoint("BOTTOMLEFT", overlay, "BOTTOMRIGHT", -PCT_COL_WIDTH, 1)
		div:SetColorTexture(0.24, 0.28, 0.36, 0.65)
		overlay._divider = div

		local txt = overlay:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
		txt:SetPoint("RIGHT", overlay, "RIGHT", -6, 0)
		txt:SetWidth(PCT_COL_WIDTH - 8)
		txt:SetJustifyH("RIGHT")
		row._aucPriceLevelOverlay = overlay
		row._aucPriceLevelText = txt
	end

	if row._aucPriceLevelOverlay and row._aucPriceLevelOverlay._divider then
		if hasPctCol ~= false then
			row._aucPriceLevelOverlay._divider:Show()
		else
			row._aucPriceLevelOverlay._divider:Hide()
		end
	end

	local txt = row._aucPriceLevelText
	local tex = row._aucPriceLevelTex
	local fontPath = (STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF")
	pcall(txt.SetFont, txt, fontPath, 12, "OUTLINE")

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

function private.ComputeRowPriceLevel(rowData, itemList)
	if not rowData then return nil end

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
		return nil
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
		return nil
	end

	local priceLevel, _, r, g, b = lib.CalcLevel(link, quantity, bidPrice, buyPrice)
	if not priceLevel then
		local fallbackWorth = private.GetRetailFallbackWorth(link, itemID, rowData, itemList)
		if fallbackWorth and fallbackWorth > 0 then
			priceLevel, _, r, g, b = lib.CalcLevel(link, quantity, bidPrice, buyPrice, fallbackWorth)
		end
	end

	return priceLevel, r, g, b
end

function private.UpdateRetailRow(row, itemList)
	if not row then return end
	local hasPctCol = itemList and itemList._aucHasPctColumn
	if not row:IsShown() then
		private.SetRetailRowBar(row, nil, nil, nil, nil, hasPctCol)
		return
	end
	local rowData = GetRowDataFromFrame(row, itemList)
	if not rowData then
		private.SetRetailRowBar(row, nil, nil, nil, nil, hasPctCol)
		return
	end
	if row.rowData == nil then
		row.rowData = rowData
	end

	local priceLevel, r, g, b = private.ComputeRowPriceLevel(rowData, itemList)
	private.SetRetailRowBar(row, r, g, b, priceLevel, hasPctCol)
end

local function GetRowSortValue(rowData, colKey, itemList)
	if type(rowData) ~= "table" then
		return (colKey == "name" or colKey == "seller") and "" or 0
	end
	if colKey == "price" then
		local qty = (rowData.quantity and rowData.quantity > 0) and rowData.quantity or 1
		return rowData.minPrice
			or rowData.unitPrice
			or (rowData.buyoutAmount and rowData.buyoutAmount > 0 and (rowData.buyoutAmount / qty))
			or (rowData.bidAmount and rowData.bidAmount > 0 and (rowData.bidAmount / qty))
			or rowData.minBid or 0
	elseif colKey == "buyout" then
		return rowData.buyoutAmount or rowData.minPrice or rowData.unitPrice or 0
	elseif colKey == "bid" then
		return rowData.bidAmount or rowData.minBid or rowData.minPrice or 0
	elseif colKey == "quantity" then
		return rowData.totalQuantity or rowData.quantity or 0
	elseif colKey == "level" then
		local ilvl = (rowData.itemKey and rowData.itemKey.itemLevel) or rowData.itemLevel
		if not ilvl or ilvl <= 0 then
			local id = rowData.itemLink or rowData.itemID or (rowData.itemKey and rowData.itemKey.itemID)
			if id then
				ilvl = select(4, GetItemInfo(id))
			end
		end
		return ilvl or 0
	elseif colKey == "timeleft" then
		return rowData.timeLeftSeconds or rowData.timeLeft or 0
	elseif colKey == "pct" then
		local pct = private.ComputeRowPriceLevel(rowData, itemList)
		return pct or 999999
	elseif colKey == "seller" then
		local oList = rowData.owners
		if type(oList) == "table" and oList[1] then
			return tostring(oList[1]):lower()
		end
		return tostring(rowData.bidder or rowData.ownerName or ""):lower()
	elseif colKey == "name" then
		local name = rowData.itemName or rowData.name
		if not name and rowData.itemKey and C_AuctionHouse and C_AuctionHouse.GetItemKeyInfo then
			local ok, info = pcall(C_AuctionHouse.GetItemKeyInfo, rowData.itemKey)
			if ok and info and info.itemName then
				name = info.itemName
			end
		end
		if not name then
			local id = rowData.itemLink or rowData.itemID or (rowData.itemKey and rowData.itemKey.itemID)
			if id then
				name = GetItemInfo(id)
			end
		end
		return tostring(name or ""):lower()
	end
	return 0
end

local function DetectHeaderColumnKey(hdr, colIdx)
	if not hdr then return "price" end
	if hdr._aucColKey then return hdr._aucColKey end
	local so = hdr.sortOrder
	if so ~= nil then
		if so == 0 then return "price"
		elseif so == 1 then return "name"
		elseif so == 2 then return "level"
		elseif so == 3 then return "bid"
		elseif so == 4 then return "buyout"
		elseif so == 5 then return "timeleft"
		end
	end
	if hdr.Icon and hdr.Icon:IsShown() then
		return "timeleft"
	end
	local txt = (hdr.Text and hdr.Text.GetText and hdr.Text:GetText()) or (hdr.GetText and hdr:GetText()) or ""
	local low = txt:lower()
	if low == "%" then return "pct"
	elseif low:find("verf") or low:find("avail") or low:find("menge") or low:find("anz") or low:find("quant") then return "quantity"
	elseif low:find("st%.") or low:find("stufe") or low:find("lvl") or low:find("level") then return "level"
	elseif low:find("gebot") or low:find("bid") then return "bid"
	elseif low:find("kauf") or low:find("sofort") or low:find("buy") then return "buyout"
	elseif low:find("preis") or low:find("price") then return "price"
	elseif low:find("gegenstand") or low:find("name") or low:find("item") or low:find("auktion") then return "name"
	elseif low:find("verk") or low:find("seller") then return "seller"
	end
	if colIdx == 1 then return "price"
	elseif colIdx == 2 then return "name"
	elseif colIdx == 3 then return "level"
	elseif colIdx == 4 then return "quantity"
	end
	return "price"
end

local function EnsureHeaderSortArrow(hdr)
	if not hdr or hdr._aucSortArrow then return hdr and hdr._aucSortArrow end
	local arrow = hdr:CreateTexture(nil, "OVERLAY", nil, 6)
	arrow:SetSize(9, 8)
	arrow:SetPoint("RIGHT", hdr, "RIGHT", -3, 0)
	arrow:SetTexture("Interface\\AddOns\\Auc-Advanced\\Libs\\ScrollSheet\\upsort")
	arrow:SetVertexColor(1, 0.85, 0.25, 1)
	arrow:Hide()
	hdr._aucSortArrow = arrow
	return arrow
end

local function UpdateHeaderSortArrows(itemList)
	if not itemList or not itemList.HeaderContainer then return end
	local activeCol = itemList._aucSortColumn
	local isAsc = itemList._aucSortAscending

	local headers = { itemList.HeaderContainer:GetChildren() }
	local pctBtn = itemList._aucPctHeaderBtn or itemList.HeaderContainer._aucPctHeaderBtn
	if pctBtn then
		table.insert(headers, pctBtn)
	end
	for idx, hdr in ipairs(headers) do
		if hdr then
			if hdr.Arrow and hdr.Arrow.Hide then
				hdr.Arrow:Hide()
				if hdr.Arrow.SetAlpha then hdr.Arrow:SetAlpha(0) end
			end
			local arrow = EnsureHeaderSortArrow(hdr)
			local colKey = DetectHeaderColumnKey(hdr, idx)
			if activeCol and colKey == activeCol and arrow then
				arrow:SetTexture(isAsc and "Interface\\AddOns\\Auc-Advanced\\Libs\\ScrollSheet\\upsort" or "Interface\\AddOns\\Auc-Advanced\\Libs\\ScrollSheet\\downsort")
				arrow:Show()
			elseif arrow then
				arrow:Hide()
			end
		end
	end
end

local function ApplySortToItemList(itemList)
	if not itemList or not itemList._aucSortColumn then return end
	if itemList._aucBuildingSort then return end
	itemList._aucBuildingSort = true
	local colKey = itemList._aucSortColumn
	local asc = itemList._aucSortAscending

	-- 1. Build index permutation map via rawProvider (works for BrowseResultsFrame, ItemBuyFrame, CommoditiesBuyFrame, AuctionsFrame, etc.)
	local rawProvider = itemList._aucRawDataProvider
		or (itemList.tableBuilder and itemList.tableBuilder._aucRawDataProvider)
		or (itemList.getEntry ~= itemList._aucWrappedProviderFn and itemList.getEntry)
		or (itemList.dataProvider ~= itemList._aucWrappedProviderFn and itemList.dataProvider)
		or (itemList.tableBuilder and itemList.tableBuilder.dataProvider ~= itemList._aucWrappedProviderFn and itemList.tableBuilder.dataProvider)
	local numEntries = 0
	if type(itemList.getNumEntries) == "function" then
		local ok, n = pcall(itemList.getNumEntries)
		if ok and type(n) == "number" then numEntries = n end
	elseif type(itemList.numEntries) == "number" then
		numEntries = itemList.numEntries
	end

	if type(rawProvider) == "function" and numEntries > 1 then
		local indices = {}
		local keys = {}
		for i = 1, numEntries do
			indices[i] = i
			local ok, entry = pcall(rawProvider, i)
			keys[i] = GetRowSortValue(ok and type(entry) == "table" and entry or nil, colKey, itemList)
		end
		table.sort(indices, function(ia, ib)
			local va, vb = keys[ia], keys[ib]
			if va == vb then
				return ia < ib
			end
			if asc then return va < vb else return va > vb end
		end)
		itemList._aucSortedMap = indices
		itemList._aucSortedMapCount = numEntries
		itemList._aucSortedMapDirty = false
		itemList._aucBuildingSort = false
		return
	end

	-- 2. Fallback: if BrowseResultsFrame.browseResults is a table and rawProvider wasn't available, sort in-place
	if AuctionHouseFrame and AuctionHouseFrame.BrowseResultsFrame
	and itemList == AuctionHouseFrame.BrowseResultsFrame.ItemList
	and type(AuctionHouseFrame.BrowseResultsFrame.browseResults) == "table" then
		local list = AuctionHouseFrame.BrowseResultsFrame.browseResults
		if #list > 1 then
			table.sort(list, function(a, b)
				local va = GetRowSortValue(a, colKey, itemList)
				local vb = GetRowSortValue(b, colKey, itemList)
				if va == vb then
					local pa = (a and a.minPrice) or 0
					local pb = (b and b.minPrice) or 0
					if asc then return pa < pb else return pa > pb end
				end
				if asc then return va < vb else return va > vb end
			end)
		end
		itemList._aucSortedMap = nil
		itemList._aucSortedMapCount = #list
		itemList._aucSortedMapDirty = false
		itemList._aucBuildingSort = false
		return
	end

	itemList._aucSortedMap = nil
	itemList._aucSortedMapCount = numEntries
	itemList._aucSortedMapDirty = false
	itemList._aucBuildingSort = false
end

local function SortRetailItemListByColumn(itemList, colKey)
	if not itemList or not colKey then return end
	if itemList._aucSortColumn == colKey then
		itemList._aucSortAscending = not itemList._aucSortAscending
	else
		itemList._aucSortColumn = colKey
		itemList._aucSortAscending = true
	end
	if PlaySound then
		PlaySound(SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CheckBox_ON or 856)
	end
	itemList._aucSortedMapDirty = true
	ApplySortToItemList(itemList)
	UpdateHeaderSortArrows(itemList)
	if itemList.RefreshScrollFrame then
		pcall(itemList.RefreshScrollFrame, itemList)
	elseif itemList.UpdateTable then
		pcall(itemList.UpdateTable, itemList)
	end
	if itemList.ScrollBox and itemList.ScrollBox.FullUpdate then
		pcall(itemList.ScrollBox.FullUpdate, itemList.ScrollBox, true)
	end
	private.UpdateRetailItemList(itemList)
end

local function EnsureBrowseListNameBeforePrice(itemList)
	-- 1. Hook AuctionHouseTableBuilder.GetBrowseListLayout so future layouts build Name first, Price second
	if AuctionHouseTableBuilder and type(AuctionHouseTableBuilder.GetBrowseListLayout) == "function" and not AuctionHouseTableBuilder._aucBrowseLayoutWrapped then
		AuctionHouseTableBuilder._aucBrowseLayoutWrapped = true
		local origGetBrowseListLayout = AuctionHouseTableBuilder.GetBrowseListLayout
		AuctionHouseTableBuilder.GetBrowseListLayout = function(owner, list, extraInfoColumn, ...)
			local origLayoutFn = origGetBrowseListLayout(owner, list, extraInfoColumn, ...)
			if type(origLayoutFn) ~= "function" then
				return origLayoutFn
			end
			return function(tableBuilder)
				local origAddPrice = AuctionHouseTableBuilder.AddPriceColumn
				local origAddName = AuctionHouseTableBuilder.AddNameColumn
				if type(origAddPrice) == "function" and type(origAddName) == "function" then
					local deferredPriceArgs = nil
					AuctionHouseTableBuilder.AddPriceColumn = function(...)
						deferredPriceArgs = { ... }
					end
					AuctionHouseTableBuilder.AddNameColumn = function(...)
						local res = origAddName(...)
						if deferredPriceArgs then
							local args = deferredPriceArgs
							deferredPriceArgs = nil
							origAddPrice(unpack(args))
						end
						return res
					end
					local ok, err = pcall(origLayoutFn, tableBuilder)
					if deferredPriceArgs then
						origAddPrice(unpack(deferredPriceArgs))
						deferredPriceArgs = nil
					end
					AuctionHouseTableBuilder.AddPriceColumn = origAddPrice
					AuctionHouseTableBuilder.AddNameColumn = origAddName
					if not ok then error(err, 0) end
				else
					origLayoutFn(tableBuilder)
				end
			end
		end
	end

	-- 2. For BrowseResultsFrame.ItemList, ensure existing tableBuilder has Name before Price
	if not itemList or not AuctionHouseFrame or not AuctionHouseFrame.BrowseResultsFrame then return end
	if itemList ~= AuctionHouseFrame.BrowseResultsFrame.ItemList then return end
	local tb = itemList.tableBuilder
	if not tb or type(tb.columns) ~= "table" or #tb.columns < 2 then return end

	local col1, col2 = tb.columns[1], tb.columns[2]
	local k1 = col1 and DetectHeaderColumnKey(col1.headerFrame, 1)
	local k2 = col2 and DetectHeaderColumnKey(col2.headerFrame, 2)
	if k1 == "price" and k2 == "name" then
		-- If SetupTableBuilder is available and we haven't rebuilt it yet, rebuild cleanly via our wrapped layout
		if not itemList._aucRebuiltNameFirst and type(AuctionHouseFrame.BrowseResultsFrame.SetupTableBuilder) == "function" then
			itemList._aucRebuiltNameFirst = true
			pcall(AuctionHouseFrame.BrowseResultsFrame.SetupTableBuilder, AuctionHouseFrame.BrowseResultsFrame)
			tb = itemList.tableBuilder
			col1 = tb and tb.columns and tb.columns[1]
			col2 = tb and tb.columns and tb.columns[2]
			k1 = col1 and DetectHeaderColumnKey(col1.headerFrame, 1)
			k2 = col2 and DetectHeaderColumnKey(col2.headerFrame, 2)
		end
		-- Fallback: swap columns[1] and columns[2] (and existing row cells) directly
		if tb and type(tb.columns) == "table" and k1 == "price" and k2 == "name" then
			tb.columns[1], tb.columns[2] = tb.columns[2], tb.columns[1]
			if type(tb.rows) == "table" then
				for _, row in pairs(tb.rows) do
					if type(row) == "table" and type(row.cells) == "table" and row.cells[1] and row.cells[2] then
						row.cells[1], row.cells[2] = row.cells[2], row.cells[1]
					end
				end
			end
			if tb.Arrange then
				pcall(tb.Arrange, tb)
			end
		end
	end
end

local function InstallSortableDataProvider(itemList)
	if not itemList then return end

	if not itemList._aucWrapProviderFn then
		itemList._aucWrapProviderFn = function(fn)
			if type(fn) ~= "function"
			or fn == itemList._aucWrappedProviderFn
			or fn == itemList.hasSearchStartedFunc
			or fn == itemList.getNumEntries
			or fn == itemList.hasFullResults then
				return fn
			end
			itemList._aucRawDataProvider = fn
			if itemList.tableBuilder then
				itemList.tableBuilder._aucRawDataProvider = fn
			end
			itemList._aucWrappedProviderFn = function(index, ...)
				if type(index) ~= "number" then
					return itemList._aucRawDataProvider(index, ...)
				end
				local numEntries = (type(itemList.getNumEntries) == "function" and itemList.getNumEntries()) or itemList.numEntries
				if itemList._aucSortColumn and not itemList._aucBuildingSort then
					if itemList._aucSortedMapDirty or not itemList._aucSortedMap or (type(numEntries) == "number" and itemList._aucSortedMapCount ~= numEntries) then
						ApplySortToItemList(itemList)
					end
				end
				local mapped = (itemList._aucSortedMap and itemList._aucSortedMap[index]) or index
				if type(numEntries) == "number" and numEntries > 0 and mapped > numEntries then
					mapped = index
				end
				local res = itemList._aucRawDataProvider(mapped, ...)
				if res == nil and mapped ~= index then
					res = itemList._aucRawDataProvider(index, ...)
				end
				return res
			end
			return itemList._aucWrappedProviderFn
		end
	end
	local WrapProvider = itemList._aucWrapProviderFn

	if type(itemList.getEntry) == "function" and itemList.getEntry ~= itemList._aucWrappedProviderFn then
		itemList.getEntry = WrapProvider(itemList.getEntry)
	end
	if type(itemList.dataProvider) == "function" and itemList.dataProvider ~= itemList._aucWrappedProviderFn then
		itemList.dataProvider = WrapProvider(itemList.dataProvider)
	end
	if itemList.tableBuilder and type(itemList.tableBuilder.dataProvider) == "function" and itemList.tableBuilder.dataProvider ~= itemList._aucWrappedProviderFn then
		itemList.tableBuilder.dataProvider = WrapProvider(itemList.tableBuilder.dataProvider)
	end

	if not itemList._aucDataProviderWrapped then
		itemList._aucDataProviderWrapped = true
		if itemList.SetDataProvider then
			-- Note: AuctionHouseItemListMixin:SetDataProvider(hasSearchStartedFunc, getEntry, getNumEntries, hasFullResults)
			-- sets self.getEntry = getEntry (or self.dataProvider = getEntry) as 2nd arg. Never wrap arg1 (hasSearchStartedFunc)!
			hooksecurefunc(itemList, "SetDataProvider", function(self, _, getEntry)
				local targetFn = (type(getEntry) == "function" and getEntry) or self.getEntry or self.dataProvider
				if type(targetFn) == "function" then
					local w = WrapProvider(targetFn)
					if self.getEntry ~= nil or type(getEntry) == "function" then
						self.getEntry = w
					end
					if self.dataProvider ~= nil then
						self.dataProvider = w
					end
					if self.tableBuilder then
						self.tableBuilder.dataProvider = w
					end
				end
			end)
		end
		if itemList.SetTableBuilderLayout then
			hooksecurefunc(itemList, "SetTableBuilderLayout", function(self)
				InstallSortableDataProvider(self)
			end)
		end
		if itemList.OnEnterListLine then
			-- Guard against nil rowData in OnEnterListLine if hovered while loading
			local origOnEnterListLine = itemList.OnEnterListLine
			itemList.OnEnterListLine = function(self, line, rowData, ...)
				if rowData == nil and line then
					rowData = GetRowDataFromFrame(line, self)
					if line.rowData == nil then line.rowData = rowData end
				end
				if type(rowData) ~= "table" then return end
				return origOnEnterListLine(self, line, rowData, ...)
			end
		end
	end

	local tb = itemList.tableBuilder
	if tb and not tb._aucTableHooksInstalled then
		tb._aucTableHooksInstalled = true
		if tb.SetDataProvider then
			hooksecurefunc(tb, "SetDataProvider", function(selfTb, newProvider)
				if type(newProvider) == "function" then
					selfTb.dataProvider = WrapProvider(newProvider)
				end
			end)
		end
		local function ClampTableWidth(selfTb)
			if not itemList._aucHasPctColumn or selfTb._aucAdjustingWidth then return end
			local fullW = (itemList.HeaderContainer and itemList.HeaderContainer:GetWidth())
				or (itemList.ScrollBox and itemList.ScrollBox:GetWidth())
				or (itemList.ScrollFrame and itemList.ScrollFrame:GetWidth())
			if fullW and fullW > 200 then
				local targetW = fullW - PCT_COL_WIDTH
				local curW = (selfTb.GetTableWidth and selfTb:GetTableWidth()) or selfTb.tableWidth or fullW
				if math.abs(curW - targetW) > 2 then
					selfTb._aucAdjustingWidth = true
					if selfTb.SetTableWidth then
						selfTb:SetTableWidth(targetW)
					else
						selfTb.tableWidth = targetW
					end
					selfTb._aucAdjustingWidth = false
				end
			end
		end
		if tb.SetTableWidth then
			hooksecurefunc(tb, "SetTableWidth", function(selfTb)
				ClampTableWidth(selfTb)
			end)
		end
		if tb.CalculateColumnSpacing then
			hooksecurefunc(tb, "CalculateColumnSpacing", function(selfTb)
				ClampTableWidth(selfTb)
			end)
		end
	end
end

local function SetupHeaderButtonsSorting(itemList)
	if not itemList or not itemList.HeaderContainer then return end
	EnsureBrowseListNameBeforePrice(itemList)
	InstallSortableDataProvider(itemList)

	-- Keep HeaderContainer at its full width (-22) because ScrollBox and MinimalScrollBar are anchored to HeaderContainer's RIGHT!
	local hcH = itemList.HeaderContainer:GetHeight()
	if not hcH or hcH < 16 then hcH = 19 end
	itemList.HeaderContainer:ClearAllPoints()
	itemList.HeaderContainer:SetPoint("TOPLEFT", itemList, "TOPLEFT", 4, -4)
	itemList.HeaderContainer:SetPoint("TOPRIGHT", itemList, "TOPRIGHT", -22, -4)
	itemList.HeaderContainer:SetHeight(hcH)

	-- Reserve the rightmost PCT_COL_WIDTH (56px) of HeaderContainer for the "%" column by clamping tableBuilder width
	if itemList._aucHasPctColumn and itemList.tableBuilder then
		local fullW = itemList.HeaderContainer:GetWidth()
			or (itemList.ScrollBox and itemList.ScrollBox:GetWidth())
			or (itemList.ScrollFrame and itemList.ScrollFrame:GetWidth())
		if fullW and fullW > 200 then
			local targetW = fullW - PCT_COL_WIDTH
			local curW = (itemList.tableBuilder.GetTableWidth and itemList.tableBuilder:GetTableWidth()) or itemList.tableBuilder.tableWidth or fullW
			if math.abs(curW - targetW) > 2 then
				if itemList.tableBuilder.SetTableWidth then
					pcall(itemList.tableBuilder.SetTableWidth, itemList.tableBuilder, targetW)
				end
				if itemList.tableBuilder.Arrange then
					pcall(itemList.tableBuilder.Arrange, itemList.tableBuilder)
				end
			end
		end
	end

	if AucAdvanced and AucAdvanced.StyleRetailHeaderContainer then
		AucAdvanced.StyleRetailHeaderContainer(itemList)
	end

	-- Create or update dedicated "%" column header button inside the rightmost 56px of HeaderContainer (directly above the 0% column)
	if itemList._aucHasPctColumn then
		if itemList.HeaderContainer._aucPctHeader then
			itemList.HeaderContainer._aucPctHeader:Hide()
		end
		local pctBtn = itemList._aucPctHeaderBtn or itemList.HeaderContainer._aucPctHeaderBtn
		if not pctBtn then
			pctBtn = CreateFrame("Button", nil, itemList.HeaderContainer)
			pctBtn._aucColKey = "pct"
			pctBtn:EnableMouse(true)
			pctBtn:RegisterForClicks("AnyUp")
			local txt = pctBtn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
			txt:SetText("%")
			txt:SetTextColor(0.95, 0.82, 0.30, 1)
			pctBtn.Text = txt
			EnsureHeaderSortArrow(pctBtn)
			pctBtn:SetScript("OnClick", function()
				SortRetailItemListByColumn(itemList, "pct")
			end)
			itemList._aucPctHeaderBtn = pctBtn
			itemList.HeaderContainer._aucPctHeaderBtn = pctBtn
		else
			pctBtn:SetParent(itemList.HeaderContainer)
			pctBtn:EnableMouse(true)
			pctBtn:RegisterForClicks("AnyUp")
		end
		pctBtn:SetFrameLevel(math.max(20, (itemList.HeaderContainer:GetFrameLevel() or 10) + 15))
		pctBtn:ClearAllPoints()
		pctBtn:SetPoint("TOPRIGHT", itemList.HeaderContainer, "TOPRIGHT", 0, 0)
		pctBtn:SetPoint("BOTTOMRIGHT", itemList.HeaderContainer, "BOTTOMRIGHT", 0, 0)
		pctBtn:SetWidth(PCT_COL_WIDTH)
		pctBtn:SetHitRectInsets(0, 0, 0, 0)
		if pctBtn.Text then
			pctBtn.Text:ClearAllPoints()
			pctBtn.Text:SetPoint("CENTER", pctBtn, "CENTER", 0, 0)
			pctBtn.Text:SetJustifyH("CENTER")
			pctBtn.Text:SetText("%")
			pctBtn.Text:SetTextColor(0.95, 0.82, 0.30, 1)
		end
		pctBtn:Show()
		if AucAdvanced and AucAdvanced.StyleRetailHeaderButton then
			AucAdvanced.StyleRetailHeaderButton(pctBtn)
		end
	end

	-- Make every column header in HeaderContainer clickable for ascending/descending sort
	local children = { itemList.HeaderContainer:GetChildren() }
	local colIdx = 0
	for _, hdr in ipairs(children) do
		if hdr and hdr ~= itemList._aucPctHeaderBtn and hdr ~= itemList.HeaderContainer._aucPctHeaderBtn and hdr:IsShown() then
			colIdx = colIdx + 1
			local colKey = DetectHeaderColumnKey(hdr, colIdx)
			hdr._aucColKey = colKey
			EnsureHeaderSortArrow(hdr)
			if hdr.Text and hdr.Text.ClearAllPoints then
				hdr.Text:ClearAllPoints()
				hdr.Text:SetPoint("LEFT", hdr, "LEFT", 6, 0)
				hdr.Text:SetPoint("RIGHT", hdr, "RIGHT", -14, 0)
				hdr.Text:SetJustifyH("LEFT")
			end
			pcall(hdr.EnableMouse, hdr, true)
			if hdr.IsObjectType and hdr:IsObjectType("Button") then
				pcall(hdr.RegisterForClicks, hdr, "AnyUp")
				hdr:SetScript("OnClick", function()
					SortRetailItemListByColumn(itemList, colKey)
				end)
			else
				hdr:SetScript("OnMouseUp", function(_, button)
					if button == "LeftButton" then
						SortRetailItemListByColumn(itemList, colKey)
					end
				end)
			end
		end
	end

	UpdateHeaderSortArrows(itemList)
end

function private.UpdateRetailItemList(itemList)
	if not itemList or not itemList:IsVisible() then return end
	if AuctionHouseFrame then
		if (AuctionHouseFrame.BrowseResultsFrame and itemList == AuctionHouseFrame.BrowseResultsFrame.ItemList)
		or (AuctionHouseFrame.ItemBuyFrame and itemList == AuctionHouseFrame.ItemBuyFrame.ItemList)
		or (AuctionHouseFrame.CommoditiesBuyFrame and itemList == AuctionHouseFrame.CommoditiesBuyFrame.ItemList) then
			itemList._aucHasPctColumn = true
		end
	end
	SetupHeaderButtonsSorting(itemList)
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

local function HookSingleRetailItemList(itemList, hasPctColumn)
	if not itemList or private.hookedItemLists[itemList] then return end
	private.hookedItemLists[itemList] = true
	if hasPctColumn then
		itemList._aucHasPctColumn = true
	end
	itemList._aucOnReflowHeaders = SetupHeaderButtonsSorting
	InstallSortableDataProvider(itemList)

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
		if AucAdvanced and AucAdvanced.ReflowRetailAHInternalFrames and AuctionHouseFrame then
			AucAdvanced.ReflowRetailAHInternalFrames(AuctionHouseFrame)
		end
		private.UpdateRetailItemList(self)
	end)
end

function private.HookRetailAH()
	if not AuctionHouseFrame then return end
	if AuctionHouseFrame.BrowseResultsFrame and AuctionHouseFrame.BrowseResultsFrame.ItemList then
		HookSingleRetailItemList(AuctionHouseFrame.BrowseResultsFrame.ItemList, true)
	end
	if AuctionHouseFrame.ItemBuyFrame and AuctionHouseFrame.ItemBuyFrame.ItemList then
		HookSingleRetailItemList(AuctionHouseFrame.ItemBuyFrame.ItemList, true)
	end
	if AuctionHouseFrame.CommoditiesBuyFrame and AuctionHouseFrame.CommoditiesBuyFrame.ItemList then
		HookSingleRetailItemList(AuctionHouseFrame.CommoditiesBuyFrame.ItemList, true)
	end
	if AuctionHouseFrame.ItemSellList then
		HookSingleRetailItemList(AuctionHouseFrame.ItemSellList, false)
	end
	if AuctionHouseFrame.CommoditiesSellList then
		HookSingleRetailItemList(AuctionHouseFrame.CommoditiesSellList, false)
	end
	if AuctionHouseFrame.AuctionsFrame then
		local af = AuctionHouseFrame.AuctionsFrame
		if af.AllAuctionsList then HookSingleRetailItemList(af.AllAuctionsList, false) end
		if af.BidsList then HookSingleRetailItemList(af.BidsList, false) end
		if af.ItemList then HookSingleRetailItemList(af.ItemList, false) end
		if af.CommoditiesList then HookSingleRetailItemList(af.CommoditiesList, false) end
	end

	if not private.retailEventFrame then
		local ef = CreateFrame("Frame")
		ef:RegisterEvent("AUCTION_HOUSE_BROWSE_RESULTS_UPDATED")
		ef:RegisterEvent("AUCTION_HOUSE_BROWSE_RESULTS_ADDED")
		ef:RegisterEvent("ITEM_SEARCH_RESULTS_UPDATED")
		ef:RegisterEvent("ITEM_SEARCH_RESULTS_ADDED")
		ef:RegisterEvent("COMMODITY_SEARCH_RESULTS_UPDATED")
		ef:RegisterEvent("OWNED_AUCTIONS_UPDATED")
		ef:RegisterEvent("BIDS_UPDATED")
		local pendingDelay = nil
		ef:SetScript("OnEvent", function()
			wipe(private.peerWorthCache)
			for itemList in pairs(private.hookedItemLists) do
				itemList._aucSortedMapDirty = true
				if itemList._aucSortColumn then
					ApplySortToItemList(itemList)
				end
			end
			private.UpdateAllRetailLists()
			pendingDelay = 0.08
		end)
		ef:SetScript("OnUpdate", function(_, elapsed)
			if not pendingDelay then return end
			pendingDelay = pendingDelay - elapsed
			if pendingDelay <= 0 then
				pendingDelay = nil
				for itemList in pairs(private.hookedItemLists) do
					itemList._aucSortedMapDirty = true
					if itemList._aucSortColumn then
						ApplySortToItemList(itemList)
					end
				end
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

	if AucAdvanced and AucAdvanced.ReflowRetailAHInternalFrames then
		AucAdvanced.ReflowRetailAHInternalFrames(AuctionHouseFrame)
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
