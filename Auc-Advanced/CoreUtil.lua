--[[
	Auctioneer
	Version: 2.5.6733 (SwimmingSeadragon)
	Revision: $Id: CoreUtil.lua 6733 2022-01-25 11:42:44Z none $
	URL: 

	This is an addon for World of Warcraft that adds statistical history to the auction data that is collected
	when the auction is scanned, so that you can easily determine what price
	you will be able to sell an item for at auction or at a vendor whenever you
	mouse-over an item in the game

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
]]

local lib = AucAdvanced
if not lib then return end
lib.CoreFileCheckIn("CoreUtil")

-- Predefine some dummy functions to protect against a load error cascade
-- These will be overwritten by the real functions, unless an error or ABORTLOAD condition occurs
lib.NewModule = lib.NOPFUNCTION
lib.SendProcessorMessage = lib.NOPFUNCTION
lib.localizations = lib.RETFUNCTION
-- End dummy functions

local tooltip = lib.Libraries.TipHelper or {}
local Const = lib.Const
local Resources = lib.Resources

local _G = _G
local pairs, ipairs, tinsert, wipe = pairs, ipairs, tinsert, wipe
local type, tonumber, tostring = type, tonumber, tostring
local pcall = pcall
local strmatch = strmatch
local select = select

local coremodule, internalUtil, private = lib.GetCoreModule("CoreUtil", "Util", true)
if coremodule and internalUtil then

	function coremodule.OnLoad(addon)
		if addon == "auc-advanced" then
			private.FactionOnLoad()
		end
	end

	coremodule.Processors = {}
	function coremodule.Processors.auctionopen()
		-- temporary check
		if private.checkAuthorizedModules then
			private.checkAuthorizedModules()
		end
	end
	function coremodule.Processors.newmodule(event, libType, libName)
		-- the only newmodule messages should come from AucAdvanced.NewModule
		-- ### this is a temporary check, until we are sure nothing else is still sending these messages
		if private.newmoduleCheckName ~= libName then
			error("Auctioneer has detected unauthorized newmodule message")
		end
	end
else
	-- if there's aleady an abort error condition, we should avoid throwing unneccesary additional errors
	if not lib.ABORTLOAD then
		local errtext = "CoreUtil was unable to register with CoreModule"
		lib.ABORTLOAD = errtext
		geterrorhandler()("Auctioneer load error: "..errtext)
	end
end

--Localization via babylonian
local availableLocales = {}
if type(AuctioneerLocalizations) == "table" then
	for loc in pairs(AuctioneerLocalizations) do
		availableLocales[loc] = true
	end
end
local Babylonian = lib.Libraries.Babylonian
if Babylonian then
	local babylonian = Babylonian(AuctioneerLocalizations)
	function lib.localizations(stringKey)
		local locale = (lib.Settings and lib.Settings.GetSetting and lib.Settings.GetSetting("SelectedLocale")) or GetLocale()
		-- translated key or english Key or Raw Key
		return babylonian(locale, stringKey) or babylonian[stringKey] or stringKey
	end
end
AuctioneerLocalizations = nil

--The following function will build tables correlating Chat Frame names with their index numbers, and return different formats according to an option passed in.
function lib.getFrameNames(option)
	local frames = {}
	local frameName = ""
--This iterates through the first 10 ChatWindows, getting the name associated with it.
	for i=1, 10 do
		local name, fontSize, r, g, b, a, shown, locked, docked = GetChatWindowInfo(i)
		--If the name isn't blank, then we build tables where the Chat Frame names are the keys, and indexes the values if the frame is either shown or docked.
		if (name ~= "" and (shown or docked)) then
			frames[name] = i
		end
	end
	--Next, if a number was passed as an option, we simply retrieve the frame name and assign it to frameName
	if (type(option) == "number") then
		local name, fontSize, r, g, b, a, shown, locked, docked = GetChatWindowInfo(option);
		frameName = name
		return frameName
	--If no option was specified, we return the Name=>Index table
	elseif (not option) then
		return frames
	end
end

--This function will be called by our configuration screen to build the appropriate list.
function lib.configFramesList()
	local configFrames = {}
	for i=1, 10 do
		local name, fontSize, r, g, b, a, shown, locked, docked = GetChatWindowInfo(i)
		if (name ~= "") and (docked or shown) then
			tinsert(configFrames, {name, name})
		end
	end
	return configFrames
end
--This function will retrieve the index we've got stored for the user
function lib.getFrameIndex()
	--Check to make sure AucAdvanced.Settings exists, if not initialize it
	if (not lib.Settings) then
		lib.Settings = {}
	end
	local get = lib.Settings.GetSetting
	--Get the value of AucAdvanced.Settings["printwindow"]
	local value = get("printwindow")
	--If that value doesn't exist, we return a default of 0
	if (not value) then
		return 0
	end
	--Otherwise, we return the value
	return value
end

--This function is used to store the user's preferred chatframe
function lib.setFrame(frame)
	local set = lib.Settings.SetSetting
	--If called with no argument
	if (not frame) then
		frame = 0
	--Compatibility, for those who had set this previously.
	elseif (type(frame) == "number" and frame > 0 and frame < 10) then
		frame = GetChatWindowInfo(frame)
	--If the frame argument is a string, set that as the frameNumber
	elseif (type(frame) == "string") then
		set("printwindow", frame)
	--Otherwise set it to 0
	else
		set("printwindow", 0)
	end
end

--This is the printing function.  If the user has selected a preferred chatframe, we'll use it.  If not, we'll default to the first one.
function lib.Print(...)
	local output, part, frameIndex
	local frame = lib.getFrameIndex()
	local allFrames = lib.getFrameNames()
	if (type(frame) == "string") then
		if (allFrames[frame]) then
			frameIndex = allFrames[frame]
		else
			frameIndex = 1
		end
	--For backward compatibility
	elseif (type(frame) == "number" and frame > 0 and frame < 9) then
		frameIndex = frame
	elseif (frame == 0) then
		frameIndex = 1
	else
		frameIndex = 1
	end
	local frameReference = _G["ChatFrame"..frameIndex]
	for i=1, select("#", ...) do
		part = select(i, ...)
		part = tostring(part):gsub("{{", "|cffddeeff"):gsub("}}", "|r")
		if (output) then output = output .. " " .. part
		else output = part end
	end
	--If we have a stored chat frame, print our output there
	if (frameReference) then
		frameReference:AddMessage(output, 0.3, 0.9, 0.8)
	--Otherwise, print it to the client's DEFAULT_CHAT_FRAME
	else
		DEFAULT_CHAT_FRAME:AddMessage(output, 0.3, 0.9, 0.8)
	end
end

--Creates the list of locales to choose from
function lib.changeLocale()
	local localizations, default = {}, lib.Settings.GetSetting("SelectedLocale") --get the user choosen locale make it first on the list
	for i in pairs(availableLocales) do
		if default == i then
			tinsert(localizations,1, {i, i})
		else
			tinsert(localizations, {i, i})
		end
	end
	return localizations
end

-- Creates the list of Pricing Models for use in dropdowns
-- Usage: gui:AddControl(id, "Selectbox",  column, indent, AucAdvanced.selectorPriceModels, "util.modulename.model")
do
	local pricemodels
	function private.resetPriceModels()
		-- called every time a new module loads
		pricemodels = nil
	end
	function lib.selectorPriceModels()
		if not pricemodels then
			-- delay creating table until function is first called, to give all modules a chance to load first
			pricemodels = {}
			tinsert(pricemodels,{"market", lib.localizations("ADV_Interface_MarketPrice")})--Market Price
			local algoList, algoNames = lib.API.GetAlgorithms()
			for pos, name in ipairs(algoList) do
				tinsert(pricemodels,{name, format(lib.localizations("ADV_Interface_Algorithm_Price"), algoNames[pos])})--%s Price
			end
		end
		return pricemodels
	end
end

-- Common Dropdown Tables
-- Usage: gui:AddControl(id, "Selectbox",  column, indent, AucAdvanced.selectorXXXX, "libtype.modulename.yyyy")
do
	local auctionlength = {
		{12, FORMATED_HOURS:format(12)},
		{24, FORMATED_HOURS:format(24)},
		{48, FORMATED_HOURS:format(48)},
	}

    if AucAdvanced.Classic == 1 then
        auctionlength = {
            {2, FORMATED_HOURS:format(2)},
            {8, FORMATED_HOURS:format(8)},
            {24, FORMATED_HOURS:format(24)},
        }
    end

	-- List of Auction Durations for use in deposit cost dropdowns
	function lib.selectorAuctionLength()
		return auctionlength
	end

	local alevelA = {
		{Const.ALEVEL_OFF, "Off"},
		{Const.ALEVEL_LOW, "Low"},
		{Const.ALEVEL_MED, "Medium"},
		{Const.ALEVEL_HI, "High"},
	}
	-- Creates a list of Activity Levels for general use
	-- ALEVEL constants are numbers of increasing value, so modules may test for example: value >= Const.ALEVEL_MED
	-- Proposed to introduce variations of this table in future, with different combinations of values
	-- thus this variant has been called type 'A', having values OFF, LOW, MED, HI
	function lib.selectorActivityLevelA()
		return alevelA
	end

	-- MIN, LOW, MED, HI - for settings where 'OFF' would be inappropriate
	local alevelB = {
		{Const.ALEVEL_MIN, "Minimum"},
		{Const.ALEVEL_LOW, "Low"},
		{Const.ALEVEL_MED, "Medium"},
		{Const.ALEVEL_HI, "High"},
	}
	function lib.selectorActivityLevelB()
		return alevelB
	end

end


function lib.GetFactor(...) return tooltip:GetFactor(...) end
function lib.SanitizeLink(link, ...)
	-- nTipHelper's normalizer is a classic 10-field item-link regex. On modern
	-- clients it corrupts item links (it rewrites the level field), while the
	-- retail scan stores links verbatim from GetReplicateItemLink. Keep query
	-- links verbatim too, otherwise GetMarketValue/QueryImage/stat lookups can
	-- never match the stored image and tooltips show "Not Available".
	if AucAdvanced.IsRetailAH then
		return link
	end
	return tooltip:SanitizeLink(link, ...)
end
function lib.DecodeLink(...) return tooltip:DecodeLink(...) end
function lib.GetLinkQuality(...) return tooltip:GetLinkQuality(...) end
function lib.ShowItemLink(...) return tooltip:ShowItemLink(...) end
function lib.ShowPetLink(...) return tooltip:ShowPetLink(...) end

-- Caching for GetItemInfo, provided by LibAucItemCache (via TipHelper)
-- returns = lib.GetItemInfoCache(item, select)
	-- item is the parameter to be used in GetItemInfo
	-- select specifies the first return value, like the lua select function (i.e. if select = 11, only return values 11 - 17 will be returned)
lib.GetItemInfoCache = tooltip.GetItemInfoCache

-- Tools for splitting BonusIDs (from LibAucSplitBonus)
-- BONUSIDPATTERNS : lookup table containg match templates
-- ParseToBonusIDString(BonusIDCount, Tail) : function
lib.GetBonusIDStringTools = function() return tooltip.BONUSIDPATTERNS, tooltip.ParseToBonusIDString end

do -- Faction related functions
	local lookupfaction = {
		["alliance"] = "Alliance",
		[FACTION_ALLIANCE:lower()] = "Alliance",
		["horde"] = "Horde",
		[FACTION_HORDE:lower()] = "Horde",
		["neutral"] = "Neutral",
	}
	-- Used to check user text input for some form of a faction name; returns standardized form if found
	-- Possible results are "Alliance", "Horde", "Neutral" or nil if not found
	function lib.IsFaction(faction)
		if type(faction) == "string" then
			return lookupfaction[faction:lower()]
		end
	end

	function lib.GetFaction()
		-- Compatibility function. Deprecated
		return Resources.ServerKey, Const.PlayerRealm, Resources.CurrentFaction
	end

	function lib.GetFactionGroup()
		-- Compatibility function. Deprecated
		return Resources.CurrentFaction
	end

	function private.FactionOnLoad()
		private.FactionOnLoad = nil
		local alliance = lib.localizations("ADV_Interface_FactionAlliance")
		local horde = lib.localizations("ADV_Interface_FactionHorde")
		local neutral = lib.localizations("ADV_Interface_FactionNeutral")

		lookupfaction[alliance:lower()] = "Alliance"
		lookupfaction[horde:lower()] = "Horde"
		lookupfaction[neutral:lower()] = "Neutral"
	end
end

function private.relevelFrame(frame)
	local minLevel = (frame:GetFrameLevel() or 1) + 2
	return private.relevelFrames(minLevel, frame:GetChildren())
end

function private.relevelFrames(minLevel, ...)
	for i = 1, select("#", ...) do
		local child = select(i, ...)
		local curLevel = child:GetFrameLevel() or 0
		if curLevel < minLevel then
			child:SetFrameLevel(minLevel)
		end
		private.relevelFrame(child)
	end
end

-- Retail tab tracking (since AuctionFrameTab1..N globals don't exist in retail)
private.RetailTabs = {}
private.RetailTabFrames = {} -- maps tab button to its content frame
private.HiddenBuiltinFrames = {}

local function ApplyLowBackgroundBox(frame, bgR, bgG, bgB, bgA, brR, brG, brB, brA, withGoldTop, withGoldBottom)
	if not frame or not frame.CreateTexture then return end
	if not frame._aucLowBg then
		local bg = frame:CreateTexture(nil, "BACKGROUND", nil, -8)
		bg:SetPoint("TOPLEFT", frame, "TOPLEFT", 1, -1)
		bg:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -1, 1)
		frame._aucLowBg = bg

		local bTop = frame:CreateTexture(nil, "BACKGROUND", nil, -7)
		bTop:SetHeight(1)
		bTop:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
		bTop:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
		frame._aucLowBorderTop = bTop

		local bBot = frame:CreateTexture(nil, "BACKGROUND", nil, -7)
		bBot:SetHeight(1)
		bBot:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 0, 0)
		bBot:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0)
		frame._aucLowBorderBot = bBot

		local bLeft = frame:CreateTexture(nil, "BACKGROUND", nil, -7)
		bLeft:SetWidth(1)
		bLeft:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
		bLeft:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 0, 0)
		frame._aucLowBorderLeft = bLeft

		local bRight = frame:CreateTexture(nil, "BACKGROUND", nil, -7)
		bRight:SetWidth(1)
		bRight:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
		bRight:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0)
		frame._aucLowBorderRight = bRight

		local accentTop = frame:CreateTexture(nil, "BACKGROUND", nil, -6)
		accentTop:SetHeight(1)
		accentTop:SetPoint("TOPLEFT", frame, "TOPLEFT", 1, -1)
		accentTop:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -1, -1)
		accentTop:SetColorTexture(0.85, 0.70, 0.20, 0.85)
		accentTop:Hide()
		frame._aucLowAccentTop = accentTop

		local accentBot = frame:CreateTexture(nil, "BACKGROUND", nil, -6)
		accentBot:SetHeight(1)
		accentBot:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 1, 1)
		accentBot:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -1, 1)
		accentBot:SetColorTexture(0.85, 0.70, 0.20, 0.75)
		accentBot:Hide()
		frame._aucLowAccentBot = accentBot
	end

	frame._aucLowBg:SetColorTexture(bgR or 0.08, bgG or 0.09, bgB or 0.12, bgA or 0.96)
	local r, g, b, a = brR or 0.24, brG or 0.28, brB or 0.36, brA or 1
	frame._aucLowBorderTop:SetColorTexture(r, g, b, a)
	frame._aucLowBorderBot:SetColorTexture(r, g, b, a)
	frame._aucLowBorderLeft:SetColorTexture(r, g, b, a)
	frame._aucLowBorderRight:SetColorTexture(r, g, b, a)
	if withGoldTop then
		frame._aucLowAccentTop:Show()
	else
		frame._aucLowAccentTop:Hide()
	end
	if withGoldBottom then
		frame._aucLowAccentBot:Show()
	else
		frame._aucLowAccentBot:Hide()
	end
end

local ResizeRetailTab
local SetRetailTabChecked

local function StyleModernAHTab(tab)
	if not tab then return end
	local Configator = LibStub and LibStub("Configator", true)
	local UIStyle = Configator and Configator.UIStyle
	if not UIStyle then return end

	local tName = tab:GetName()
	local texKeys = {
		"Left", "Middle", "Right",
		"LeftActive", "MiddleActive", "RightActive",
		"LeftHighlight", "MiddleHighlight", "RightHighlight",
		"LeftDisabled", "MiddleDisabled", "RightDisabled",
	}
	for _, k in ipairs(texKeys) do
		local tex = tab[k] or (tName and _G[tName .. k])
		if tex and tex.SetAlpha then
			tex:SetAlpha(0)
		end
	end
	for _, reg in ipairs({ tab:GetRegions() }) do
		if reg and reg.IsObjectType and reg:IsObjectType("Texture") then
			reg:SetAlpha(0)
		end
	end

	if not tab._aucTabStyled then
		tab._aucTabStyled = true

		local box = CreateFrame("Frame", nil, tab, BackdropTemplateMixin and "BackdropTemplate")
		box:SetPoint("TOPLEFT", tab, "TOPLEFT", 0, -1)
		box:SetPoint("BOTTOMRIGHT", tab, "BOTTOMRIGHT", 0, 2)
		box:EnableMouse(false)
		UIStyle.ApplyBox(box, 0.10, 0.12, 0.17, 0.98, 0.26, 0.30, 0.38, 1)
		tab._aucTabBox = box

		local goldBar = box:CreateTexture(nil, "OVERLAY", nil, 6)
		goldBar:SetHeight(2)
		goldBar:SetPoint("TOPLEFT", box, "TOPLEFT", 1, -1)
		goldBar:SetPoint("TOPRIGHT", box, "TOPRIGHT", -1, -1)
		goldBar:SetColorTexture(0.95, 0.78, 0.22, 1)
		goldBar:Hide()
		tab._aucGoldBar = goldBar

		local label = box:CreateFontString(nil, "OVERLAY", "GameFontNormal")
		label:SetPoint("CENTER", box, "CENTER", 0, 0)
		label:SetWordWrap(false)
		if label.SetNonSpaceWrap then label:SetNonSpaceWrap(false) end
		box._label = label
		tab._aucLabel = label

		if tab.SetText then
			hooksecurefunc(tab, "SetText", function(self, text)
				local fs = self.Text or (self.GetFontString and self:GetFontString())
				if fs and fs.SetAlpha then fs:SetAlpha(0) end
				if self._aucLabel then
					self._aucLabel:SetText(text or "")
					self._aucLabel:SetWidth(0)
				end
			end)
		end

		tab:HookScript("OnShow", function(self)
			ResizeRetailTab(self)
			SetRetailTabChecked(self, self._checked)
		end)

		tab:HookScript("OnEnter", function(self)
			if self._aucTabBox and not self._checked then
				self._aucTabBox:SetBackdropColor(0.16, 0.20, 0.28, 1)
				self._aucTabBox:SetBackdropBorderColor(0.75, 0.62, 0.24, 1)
				if self._aucLabel then self._aucLabel:SetTextColor(1, 0.95, 0.72, 1) end
			end
		end)
		tab:HookScript("OnLeave", function(self)
			if self._aucTabBox and not self._checked then
				self._aucTabBox:SetBackdropColor(0.10, 0.12, 0.17, 0.98)
				self._aucTabBox:SetBackdropBorderColor(0.26, 0.30, 0.38, 1)
				if self._aucLabel then self._aucLabel:SetTextColor(0.86, 0.90, 0.96, 1) end
			end
		end)
	end

	local fs = tab.Text or (tab.GetFontString and tab:GetFontString())
	local rawText = (tab.GetText and tab:GetText()) or (fs and fs:GetText()) or ""
	if fs and fs.SetAlpha then
		fs:SetAlpha(0)
	end
	if tab._aucLabel then
		local fontPath = (GameFontNormal and select(1, GameFontNormal:GetFont())) or STANDARD_TEXT_FONT
		if fontPath then
			tab._aucLabel:SetFont(fontPath, 12, "")
		end
		if rawText ~= "" then
			tab._aucLabel:SetText(rawText)
		end
		tab._aucLabel:SetWidth(0)
	end
end

SetRetailTabChecked = function(tab, checked)
	if not tab then return end
	checked = checked and true or false
	tab._checked = checked

	if checked then
		if PanelTemplates_SelectTab then
			pcall(PanelTemplates_SelectTab, tab)
		end
	else
		if PanelTemplates_DeselectTab then
			pcall(PanelTemplates_DeselectTab, tab)
		end
	end
	if tab._aucActiveBar then tab._aucActiveBar:Hide() end
	StyleModernAHTab(tab)
	local lbl = tab._aucLabel
	if tab._aucTabBox then
		if checked then
			tab._aucTabBox:SetBackdropColor(0.17, 0.21, 0.30, 1)
			tab._aucTabBox:SetBackdropBorderColor(0.92, 0.76, 0.22, 1)
			if tab._aucGoldBar then tab._aucGoldBar:Show() end
			if lbl then lbl:SetTextColor(1.0, 0.88, 0.30, 1) end
		else
			tab._aucTabBox:SetBackdropColor(0.10, 0.12, 0.17, 0.98)
			tab._aucTabBox:SetBackdropBorderColor(0.26, 0.30, 0.38, 1)
			if tab._aucGoldBar then tab._aucGoldBar:Hide() end
			if lbl then lbl:SetTextColor(0.86, 0.90, 0.96, 1) end
		end
	end
end

ResizeRetailTab = function(tab)
	if not tab then return end
	StyleModernAHTab(tab)
	local lbl = tab._aucLabel
	local textW = 54
	if lbl then
		lbl:SetWidth(0)
		textW = (lbl.GetUnboundedStringWidth and lbl:GetUnboundedStringWidth()) or (lbl.GetStringWidth and lbl:GetStringWidth()) or 54
	end
	tab:SetSize(math.max(80, math.ceil(textW + 24)), 26)
	tab:SetHitRectInsets(0, 0, 0, 0)
end

local function SyncBuiltinRetailTabStates(ahFrame)
	if not ahFrame or not ahFrame.Tabs then return end
	local customActive = (ahFrame.currentCustomTab ~= nil)
	local activeIdx = nil
	if not customActive then
		local sel = (PanelTemplates_GetSelectedTab and PanelTemplates_GetSelectedTab(ahFrame)) or ahFrame.selectedTab
		if sel and ahFrame.Tabs[sel] and not ahFrame.Tabs[sel]._isCustomRetailTab then
			activeIdx = sel
		end
		if not activeIdx and ahFrame.displayMode then
			for idx, t in ipairs(ahFrame.Tabs) do
				if t and not t._isCustomRetailTab and t.displayMode == ahFrame.displayMode then
					activeIdx = idx
					break
				end
			end
		end
		if not activeIdx then
			activeIdx = 1
		end
	end
	for idx, t in ipairs(ahFrame.Tabs) do
		if t and not t._isCustomRetailTab and not private.RetailTabFrames[t] then
			SetRetailTabChecked(t, (not customActive) and (idx == activeIdx))
		end
	end
end

local function PositionRetailTabs(ahFrame)
	if not ahFrame then return end
	local offsetX = 4
	local lastBuiltin
	if ahFrame.Tabs then
		for i = 1, #ahFrame.Tabs do
			local t = ahFrame.Tabs[i]
			if t and not t._isCustomRetailTab and not private.RetailTabFrames[t] then
				ResizeRetailTab(t)
				t:ClearAllPoints()
				if not lastBuiltin then
					t:SetPoint("TOPLEFT", ahFrame, "BOTTOMLEFT", 8, 1)
				else
					t:SetPoint("TOPLEFT", lastBuiltin, "TOPRIGHT", offsetX, 0)
				end
				lastBuiltin = t
			end
		end
	end
	SyncBuiltinRetailTabStates(ahFrame)
	for _, tab in ipairs(private.RetailTabs) do
		tab:ClearAllPoints()
	end
	for idx, tab in ipairs(private.RetailTabs) do
		ResizeRetailTab(tab)
		SetRetailTabChecked(tab, tab._checked)
		if idx > 1 then
			tab:SetPoint("TOPLEFT", private.RetailTabs[idx - 1], "TOPRIGHT", offsetX, 0)
		else
			if lastBuiltin then
				tab:SetPoint("TOPLEFT", lastBuiltin, "TOPRIGHT", offsetX, 0)
			else
				tab:SetPoint("TOPLEFT", ahFrame, "BOTTOMLEFT", 8, 1)
			end
		end
	end
end

function lib.GetAHTabTemplate()
	if AucAdvanced.IsRetailAH then
		return "AuctionHouseFrameDisplayModeTabTemplate"
	else
		return "AuctionTabTemplate"
	end
end

function lib.HideAllRetailTabs()
	for _, tab in ipairs(private.RetailTabs) do
		SetRetailTabChecked(tab, false)
		local frame = private.RetailTabFrames[tab]
		if frame then frame:Hide() end
	end
end

function lib.HideBuiltinAHContent()
	if not AuctionHouseFrame then return end
	local builtInFrames = {
		"CategoriesList", "SearchBar", "BrowseResultsFrame",
		"CommoditiesBuyFrame", "ItemBuyFrame", "WoWTokenResults",
		"CommoditiesSellFrame", "CommoditiesSellList",
		"ItemSellFrame", "ItemSellList", "WoWTokenSellFrame",
		"AuctionsFrame", "MoneyFrameBorder", "MoneyFrameInset",
	}
	for _, name in ipairs(builtInFrames) do
		local frame = AuctionHouseFrame[name]
		if frame and frame:IsShown() then
			private.HiddenBuiltinFrames[frame] = frame
			pcall(frame.Hide, frame)
		end
	end

	local keep = {
		[AuctionHouseFrame.NineSlice or false] = true,
		[AuctionHouseFrame.Bg or false] = true,
		[AuctionHouseFrame.TitleContainer or false] = true,
		[AuctionHouseFrame.CloseButton or false] = true,
		[AuctionHouseFrame.PortraitFrame or false] = true,
	}
	if AuctionHouseFrame.Tabs then
		for _, t in ipairs(AuctionHouseFrame.Tabs) do
			keep[t] = true
		end
	end
	for _, t in ipairs(private.RetailTabs) do
		keep[t] = true
		local tf = private.RetailTabFrames[t]
		if tf then keep[tf] = true end
	end
	for _, child in ipairs({ AuctionHouseFrame:GetChildren() }) do
		if child and not keep[child] and not child._aucKeepVisible and child:IsShown() then
			local cName = child:GetName() or ""
			if not cName:find("CloseButton") and not cName:find("Portrait") and not cName:find("NineSlice") and not cName:find("Tab") then
				private.HiddenBuiltinFrames[child] = child
				pcall(child.Hide, child)
			end
		end
	end
end

function lib.RestoreBuiltinAHContent()
	if not AuctionHouseFrame then return end
	for key, frame in pairs(private.HiddenBuiltinFrames) do
		if frame and frame.Show then
			pcall(frame.Show, frame)
		end
		private.HiddenBuiltinFrames[key] = nil
	end
	if lib.ReflowRetailAHInternalFrames then
		lib.ReflowRetailAHInternalFrames(AuctionHouseFrame)
	end
end

local function StretchFrameBackgrounds(f)
	if not f then return end
	if f.Background and f.Background.SetPoint then
		f.Background:ClearAllPoints()
		f.Background:SetPoint("TOPLEFT", f, "TOPLEFT", 2, -2)
		f.Background:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -2, 2)
	end
	if f.Bg and f.Bg.SetPoint then
		f.Bg:ClearAllPoints()
		f.Bg:SetPoint("TOPLEFT", f, "TOPLEFT", 2, -2)
		f.Bg:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -2, 2)
	end
	for _, reg in ipairs({ f:GetRegions() }) do
		if reg and reg.IsObjectType and reg:IsObjectType("Texture") and reg:GetDrawLayer() == "BACKGROUND" then
			local w, h = reg:GetSize()
			if (w and w > 120) and (h and h > 120) then
				reg:ClearAllPoints()
				reg:SetPoint("TOPLEFT", f, "TOPLEFT", 2, -2)
				reg:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -2, 2)
			end
		end
	end
end

local function StyleRetailHeaderButton(hdr)
	if not hdr or not hdr.CreateTexture then return end
	local hName = hdr.GetName and hdr:GetName()
	for _, k in ipairs({ "Left", "Middle", "Right" }) do
		local tex = hdr[k] or (hName and _G[hName .. k])
		if tex and tex.SetAlpha then
			tex:SetAlpha(0)
		end
	end
	for _, reg in ipairs({ hdr:GetRegions() }) do
		if reg and reg.IsObjectType and reg:IsObjectType("Texture") then
			if reg ~= hdr.Arrow and reg ~= hdr.Icon and not reg._aucKeepTex then
				local layer = reg.GetDrawLayer and reg:GetDrawLayer()
				if layer == "BACKGROUND" or layer == "BORDER" or layer == "ARTWORK" then
					reg:SetAlpha(0)
				end
			end
		end
	end
	ApplyLowBackgroundBox(hdr, 0.12, 0.14, 0.19, 0.98, 0.24, 0.28, 0.36, 1, false, true)
	if hdr.Text and hdr.Text.SetTextColor then
		hdr.Text:SetTextColor(0.95, 0.82, 0.30, 1)
	end
	if not hdr._aucHeaderHoverHooked and hdr.HookScript then
		hdr._aucHeaderHoverHooked = true
		hdr:HookScript("OnEnter", function(self)
			if self._aucLowBg then
				self._aucLowBg:SetColorTexture(0.18, 0.21, 0.29, 1)
			end
		end)
		hdr:HookScript("OnLeave", function(self)
			if self._aucLowBg then
				self._aucLowBg:SetColorTexture(0.12, 0.14, 0.19, 0.98)
			end
		end)
	end
end

local function StyleRetailHeaderContainer(itemList)
	if not itemList or not itemList.HeaderContainer then return end
	for _, child in ipairs({ itemList.HeaderContainer:GetChildren() }) do
		StyleRetailHeaderButton(child)
	end
	local pctBtn = itemList._aucPctHeaderBtn or itemList.HeaderContainer._aucPctHeaderBtn
	if pctBtn then
		StyleRetailHeaderButton(pctBtn)
	end
end

lib.StyleRetailHeaderButton = StyleRetailHeaderButton
lib.StyleRetailHeaderContainer = StyleRetailHeaderContainer

local function ReflowSingleRetailItemList(itemList)
	if not itemList then return end
	StretchFrameBackgrounds(itemList)

	local ahFrame = AuctionHouseFrame
	if ahFrame then
		if (ahFrame.BrowseResultsFrame and itemList == ahFrame.BrowseResultsFrame.ItemList)
		or (ahFrame.ItemBuyFrame and itemList == ahFrame.ItemBuyFrame.ItemList)
		or (ahFrame.CommoditiesBuyFrame and itemList == ahFrame.CommoditiesBuyFrame.ItemList) then
			itemList._aucHasPctColumn = true
		end
	end
	local pctReserve = itemList._aucHasPctColumn and 56 or 0

	if itemList.HeaderContainer then
		local hcH = itemList.HeaderContainer:GetHeight()
		if not hcH or hcH < 16 then hcH = 19 end
		itemList.HeaderContainer:ClearAllPoints()
		itemList.HeaderContainer:SetPoint("TOPLEFT", itemList, "TOPLEFT", 4, -4)
		itemList.HeaderContainer:SetPoint("TOPRIGHT", itemList, "TOPRIGHT", -(22 + pctReserve), -4)
		itemList.HeaderContainer:SetHeight(hcH)
	end

	if itemList.ScrollFrame then
		local sf = itemList.ScrollFrame
		sf:SetPoint("BOTTOMRIGHT", itemList, "BOTTOMRIGHT", -22, 4)
		local buttons = sf.buttons
		if buttons and #buttons > 0 and buttons[1] then
			local sfH = sf:GetHeight() or 400
			local btnH = buttons[1]:GetHeight() or 20
			if btnH < 10 then btnH = 20 end
			local needed = math.ceil(sfH / btnH) + 2
			local template = itemList.lineTemplate or "AuctionHouseTableBuilderRowTemplate"
			if needed > #buttons and sf.scrollChild then
				for i = #buttons + 1, math.min(needed, 60) do
					local ok, newBtn = pcall(CreateFrame, "BUTTON", nil, sf.scrollChild, template)
					if ok and newBtn then
						newBtn:SetPoint("TOPLEFT", buttons[i - 1], "BOTTOMLEFT", 0, 0)
						newBtn:SetPoint("TOPRIGHT", buttons[i - 1], "BOTTOMRIGHT", 0, 0)
						newBtn:SetHeight(btnH)
						buttons[i] = newBtn
					else
						break
					end
				end
				sf.range = math.max(0, (#buttons * btnH) - sfH)
			end
			local hdrW = (itemList.HeaderContainer and itemList.HeaderContainer:GetWidth()) or ((sf:GetWidth() or 600) - pctReserve)
			local rowW = hdrW + pctReserve
			if rowW and rowW > 100 then
				for i = 1, #buttons do
					buttons[i]:SetWidth(rowW)
				end
				if sf.scrollChild then
					sf.scrollChild:SetWidth(rowW)
				end
			end
		end
	end

	if itemList.ScrollBox and itemList.ScrollBox.FullUpdate then
		pcall(itemList.ScrollBox.FullUpdate, itemList.ScrollBox, true)
	end

	if itemList.tableBuilder and itemList.HeaderContainer then
		local hdrW = itemList.HeaderContainer:GetWidth()
		if hdrW and hdrW > 100 then
			pcall(itemList.tableBuilder.SetTableWidth, itemList.tableBuilder, hdrW)
			if itemList.tableBuilder.CalculateColumnSpacing then
				pcall(itemList.tableBuilder.CalculateColumnSpacing, itemList.tableBuilder)
			end
			if itemList.tableBuilder.ArrangeHeaders then
				pcall(itemList.tableBuilder.ArrangeHeaders, itemList.tableBuilder)
			end
			if itemList.tableBuilder.ArrangeCells and itemList.tableBuilder.rows then
				for _, row in ipairs(itemList.tableBuilder.rows) do
					if row.cells and #row.cells > 0 then
						pcall(itemList.tableBuilder.ArrangeCells, itemList.tableBuilder, row)
					end
				end
			end
		end
	end

	StyleRetailHeaderContainer(itemList)
	if itemList._aucOnReflowHeaders then
		pcall(itemList._aucOnReflowHeaders, itemList)
	end

	if itemList:IsVisible() and itemList.RefreshScrollFrame then
		pcall(itemList.RefreshScrollFrame, itemList)
	end
end

function lib.ReflowRetailAHInternalFrames(ahFrame)
	ahFrame = ahFrame or AuctionHouseFrame
	if not ahFrame then return end
	StretchFrameBackgrounds(ahFrame)

	if ahFrame.CategoriesList then
		local cat = ahFrame.CategoriesList
		cat:SetPoint("BOTTOM", ahFrame, "BOTTOM", 0, 34)
		StretchFrameBackgrounds(cat)
		if cat.ScrollFrame then
			cat.ScrollFrame:SetPoint("BOTTOMRIGHT", cat, "BOTTOMRIGHT", -22, 4)
			local buttons = cat.ScrollFrame.buttons
			if buttons and #buttons > 0 and buttons[1] and cat.ScrollFrame.scrollChild then
				local sfH = cat.ScrollFrame:GetHeight() or 400
				local btnH = buttons[1]:GetHeight() or 20
				if btnH < 10 then btnH = 20 end
				local needed = math.ceil(sfH / btnH) + 2
				if needed > #buttons and HybridScrollFrame_CreateButtons then
					pcall(HybridScrollFrame_CreateButtons, cat.ScrollFrame, "AuctionHouseCategoryTemplate", 0, 0)
				end
			end
		end
		if cat:IsVisible() and AuctionHouseCategoriesListMixin_OnShow then
			pcall(AuctionHouseCategoriesListMixin_OnShow, cat)
		end
	end

	local bottomAnchoredFrames = {
		"BrowseResultsFrame",
		"ItemBuyFrame",
		"CommoditiesBuyFrame",
		"ItemSellList",
		"CommoditiesSellList",
		"AuctionsFrame",
	}
	for _, fName in ipairs(bottomAnchoredFrames) do
		local f = ahFrame[fName]
		if f then
			f:SetPoint("BOTTOM", ahFrame, "BOTTOM", 0, 28)
			StretchFrameBackgrounds(f)
		end
	end

	if ahFrame.BrowseResultsFrame and ahFrame.BrowseResultsFrame.ItemList then
		ahFrame.BrowseResultsFrame.ItemList:SetPoint("BOTTOM", ahFrame.BrowseResultsFrame, "BOTTOM", 0, 0)
		ReflowSingleRetailItemList(ahFrame.BrowseResultsFrame.ItemList)
	end
	if ahFrame.ItemBuyFrame and ahFrame.ItemBuyFrame.ItemList then
		ahFrame.ItemBuyFrame.ItemList:SetPoint("BOTTOM", ahFrame.ItemBuyFrame, "BOTTOM", 0, 32)
		ReflowSingleRetailItemList(ahFrame.ItemBuyFrame.ItemList)
	end
	if ahFrame.CommoditiesBuyFrame and ahFrame.CommoditiesBuyFrame.ItemList then
		ahFrame.CommoditiesBuyFrame.ItemList:SetPoint("BOTTOM", ahFrame.CommoditiesBuyFrame, "BOTTOM", 0, 0)
		ReflowSingleRetailItemList(ahFrame.CommoditiesBuyFrame.ItemList)
	end
	if ahFrame.ItemSellList then
		ReflowSingleRetailItemList(ahFrame.ItemSellList)
	end
	if ahFrame.CommoditiesSellList then
		ReflowSingleRetailItemList(ahFrame.CommoditiesSellList)
	end
	if ahFrame.AuctionsFrame then
		local af = ahFrame.AuctionsFrame
		if af.SummaryList then
			af.SummaryList:SetPoint("BOTTOM", af, "BOTTOM", 0, 32)
			ReflowSingleRetailItemList(af.SummaryList)
		end
		for _, subName in ipairs({ "AllAuctionsList", "BidsList", "ItemList", "CommoditiesList" }) do
			local sub = af[subName]
			if sub then
				sub:SetPoint("BOTTOM", af, "BOTTOM", 0, 32)
				ReflowSingleRetailItemList(sub)
			end
		end
	end
end

local function StyleModernIconButton(btn, labelFallback)
	if not btn or btn._aucIconBtnStyled then return end
	btn._aucIconBtnStyled = true

	local iconTex = btn.Icon or btn.icon
	for _, k in ipairs({ "Left", "Middle", "Right", "Ring", "Border", "NineSlice" }) do
		if btn[k] and btn[k].SetAlpha then btn[k]:SetAlpha(0) end
	end
	if btn.GetNormalTexture and btn:GetNormalTexture() then
		btn:GetNormalTexture():SetAlpha(0)
	end
	if btn.GetPushedTexture and btn:GetPushedTexture() then
		btn:GetPushedTexture():SetAlpha(0)
	end
	if btn.GetDisabledTexture and btn:GetDisabledTexture() then
		btn:GetDisabledTexture():SetAlpha(0)
	end
	if btn.GetHighlightTexture and btn:GetHighlightTexture() then
		btn:GetHighlightTexture():SetAlpha(0)
	end
	for _, reg in ipairs({ btn:GetRegions() }) do
		if reg and reg ~= iconTex and reg.IsObjectType and reg:IsObjectType("Texture") then
			reg:SetAlpha(0)
		end
	end

	ApplyLowBackgroundBox(btn, 0.14, 0.17, 0.23, 1, 0.28, 0.32, 0.42, 1, false, false)

	if iconTex and iconTex.SetAlpha then
		iconTex:SetAlpha(1)
		iconTex:ClearAllPoints()
		iconTex:SetPoint("CENTER", btn, "CENTER", 0, 0)
		local w, h = btn:GetSize()
		local sz = math.max(12, math.min(16, math.floor(math.min(w or 22, h or 22) * 0.65)))
		iconTex:SetSize(sz, sz)
	elseif labelFallback then
		local lbl = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
		lbl:SetPoint("CENTER", btn, "CENTER", 0, 0)
		lbl:SetText(labelFallback)
		lbl:SetTextColor(0.95, 0.82, 0.30, 1)
		btn._aucIconLabel = lbl
	end

	btn:HookScript("OnEnter", function(self)
		if self._aucLowBg then self._aucLowBg:SetColorTexture(0.22, 0.26, 0.35, 1) end
		if self._aucLowBorderTop then
			self._aucLowBorderTop:SetColorTexture(0.85, 0.70, 0.22, 1)
			self._aucLowBorderBot:SetColorTexture(0.85, 0.70, 0.22, 1)
			self._aucLowBorderLeft:SetColorTexture(0.85, 0.70, 0.22, 1)
			self._aucLowBorderRight:SetColorTexture(0.85, 0.70, 0.22, 1)
		end
	end)
	btn:HookScript("OnLeave", function(self)
		if self._aucLowBg then self._aucLowBg:SetColorTexture(0.14, 0.17, 0.23, 1) end
		if self._aucLowBorderTop then
			self._aucLowBorderTop:SetColorTexture(0.28, 0.32, 0.42, 1)
			self._aucLowBorderBot:SetColorTexture(0.28, 0.32, 0.42, 1)
			self._aucLowBorderLeft:SetColorTexture(0.28, 0.32, 0.42, 1)
			self._aucLowBorderRight:SetColorTexture(0.28, 0.32, 0.42, 1)
		end
	end)
end

local function StyleModernRetailAHChrome(ahFrame, UIStyle)
	if not ahFrame or not UIStyle or ahFrame._aucModernChromeApplied then return end
	ahFrame._aucModernChromeApplied = true

	-- Hide legacy Blizzard PortraitFrame & NineSlice chrome via Alpha=0 (100% taint-safe)
	local legacyChrome = {
		ahFrame.NineSlice,
		ahFrame.Bg,
		ahFrame.PortraitContainer,
		ahFrame.PortraitFrame,
		_G["AuctionHouseFramePortrait"],
		_G["AuctionHouseFrameBg"],
	}
	for _, region in ipairs(legacyChrome) do
		if region then
			if region.SetAlpha then region:SetAlpha(0) end
			if region.EnableMouse then pcall(region.EnableMouse, region, false) end
			if region.HookScript then
				pcall(region.HookScript, region, "OnShow", function(self)
					if self.SetAlpha then self:SetAlpha(0) end
				end)
			end
		end
	end

	-- Apply sleek modern Dark-Slate & Gold Auctioneer window background in lowest BACKGROUND sublayer
	-- (never creates a child Frame that could cover CategoriesList, ItemList, or MoneyFrame!)
	ApplyLowBackgroundBox(ahFrame, 0.07, 0.08, 0.11, 0.98, 0.26, 0.30, 0.38, 1, true, false)

	-- Draggable modern header bar
	local dragBar = CreateFrame("Frame", nil, ahFrame)
	dragBar._aucKeepVisible = true
	dragBar:SetPoint("TOPLEFT", ahFrame, "TOPLEFT", 6, -2)
	dragBar:SetPoint("TOPRIGHT", ahFrame, "TOPRIGHT", -32, -2)
	dragBar:SetHeight(22)
	dragBar:EnableMouse(true)
	dragBar:RegisterForDrag("LeftButton")
	dragBar:SetScript("OnDragStart", function()
		pcall(ahFrame.StartMoving, ahFrame)
	end)
	dragBar:SetScript("OnDragStop", function()
		pcall(ahFrame.StopMovingOrSizing, ahFrame)
	end)
	ahFrame._aucDragBar = dragBar

	if ahFrame.TitleContainer then
		ahFrame.TitleContainer._aucKeepVisible = true
		if ahFrame.TitleContainer.TitleText then
			ahFrame.TitleContainer.TitleText:SetTextColor(0.95, 0.82, 0.32)
		end
	end

	if ahFrame.CloseButton then
		local cb = ahFrame.CloseButton
		cb._aucKeepVisible = true
		cb:ClearAllPoints()
		cb:SetPoint("TOPRIGHT", ahFrame, "TOPRIGHT", -3, -3)
		cb:SetSize(20, 20)
		cb:SetFrameStrata("DIALOG")
		cb:SetFrameLevel(110)
		for _, reg in ipairs({ cb:GetRegions() }) do
			if reg and reg.IsObjectType and reg:IsObjectType("Texture") then
				reg:SetAlpha(0)
			end
		end
		if cb.Border and cb.Border.SetAlpha then cb.Border:SetAlpha(0) end
		ApplyLowBackgroundBox(cb, 0.18, 0.11, 0.13, 1, 0.42, 0.24, 0.26, 1, false, false)
		if not cb._aucCloseLabel then
			local xLbl = cb:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
			xLbl:SetPoint("CENTER", cb, "CENTER", 0, 0)
			xLbl:SetText("X")
			xLbl:SetTextColor(0.95, 0.82, 0.32, 1)
			cb._aucCloseLabel = xLbl
			cb:HookScript("OnEnter", function(self)
				if self._aucLowBg then self._aucLowBg:SetColorTexture(0.55, 0.16, 0.18, 1) end
				if self._aucCloseLabel then self._aucCloseLabel:SetTextColor(1, 1, 1, 1) end
			end)
			cb:HookScript("OnLeave", function(self)
				if self._aucLowBg then self._aucLowBg:SetColorTexture(0.18, 0.11, 0.13, 1) end
				if self._aucCloseLabel then self._aucCloseLabel:SetTextColor(0.95, 0.82, 0.32, 1) end
			end)
		end
	end

	-- Skin built-in subframes (CategoriesList, SearchBar, Results, MoneyFrame) into Dark-Slate panels
	local function SuppressNineSlice(f)
		if not f then return end
		if f.NineSlice and f.NineSlice.SetAlpha then f.NineSlice:SetAlpha(0) end
		if f.Bg and f.Bg.SetAlpha then f.Bg:SetAlpha(0) end
		if f.Background and f.Background.SetAlpha then f.Background:SetAlpha(0) end
		for _, reg in ipairs({ f:GetRegions() }) do
			if reg and reg.IsObjectType and reg:IsObjectType("Texture") then
				if reg ~= f._aucLowBg and reg ~= f._aucLowBorderTop and reg ~= f._aucLowBorderBot
				and reg ~= f._aucLowBorderLeft and reg ~= f._aucLowBorderRight
				and reg ~= f._aucLowAccentTop and reg ~= f._aucLowAccentBot then
					reg:SetAlpha(0)
				end
			end
		end
	end

	if ahFrame.CategoriesList then
		SuppressNineSlice(ahFrame.CategoriesList)
		ApplyLowBackgroundBox(ahFrame.CategoriesList, 0.08, 0.09, 0.12, 0.98, 0.22, 0.25, 0.32, 1, false, false)
	end

	local panelSubframes = {
		ahFrame.BrowseResultsFrame and ahFrame.BrowseResultsFrame.ItemList,
		ahFrame.ItemBuyFrame and ahFrame.ItemBuyFrame.ItemList,
		ahFrame.CommoditiesBuyFrame and ahFrame.CommoditiesBuyFrame.ItemList,
		ahFrame.ItemSellFrame,
		ahFrame.ItemSellList,
		ahFrame.CommoditiesSellFrame,
		ahFrame.CommoditiesSellList,
		ahFrame.AuctionsFrame and ahFrame.AuctionsFrame.SummaryList,
		ahFrame.AuctionsFrame and ahFrame.AuctionsFrame.AllAuctionsList,
		ahFrame.AuctionsFrame and ahFrame.AuctionsFrame.BidsList,
	}
	for _, sf in ipairs(panelSubframes) do
		if sf then
			SuppressNineSlice(sf)
			ApplyLowBackgroundBox(sf, 0.08, 0.09, 0.12, 0.98, 0.22, 0.25, 0.32, 1, false, false)
			StyleRetailHeaderContainer(sf)
			if sf.RefreshFrame and sf.RefreshFrame.RefreshButton then
				StyleModernIconButton(sf.RefreshFrame.RefreshButton, "R")
			end
		end
	end

	-- Keep MoneyFrame visible, only suppress the legacy silver border chrome around it
	if ahFrame.MoneyFrameBorder then SuppressNineSlice(ahFrame.MoneyFrameBorder) end
	if ahFrame.MoneyFrameInset then SuppressNineSlice(ahFrame.MoneyFrameInset) end

	local function StyleFixedWidthAHButton(btn, variant)
		if not btn then return end
		local w = btn:GetWidth()
		if w and w > 20 then
			btn._fixedWidth = math.ceil(w)
		end
		UIStyle.StyleButton(btn, variant or "default")
	end

	if ahFrame.SearchBar then
		if ahFrame.SearchBar.SearchButton then
			StyleFixedWidthAHButton(ahFrame.SearchBar.SearchButton, "primary")
		end
		if ahFrame.SearchBar.SearchBox then
			UIStyle.StyleEditBox(ahFrame.SearchBar.SearchBox)
		end
		if ahFrame.SearchBar.FilterButton then
			StyleFixedWidthAHButton(ahFrame.SearchBar.FilterButton, "default")
		end
		if ahFrame.SearchBar.FavoritesSearchButton then
			StyleModernIconButton(ahFrame.SearchBar.FavoritesSearchButton, "*")
		end
	end

	-- Style action buttons across ItemBuyFrame, CommoditiesBuyFrame, ItemSellFrame, CommoditiesSellFrame, AuctionsFrame
	if ahFrame.ItemBuyFrame then
		local ibf = ahFrame.ItemBuyFrame
		StyleFixedWidthAHButton(ibf.BackButton, "default")
		if ibf.BidFrame then StyleFixedWidthAHButton(ibf.BidFrame.BidButton, "default") end
		if ibf.BuyoutFrame then StyleFixedWidthAHButton(ibf.BuyoutFrame.BuyoutButton, "primary") end
		if ibf.RefreshFrame and ibf.RefreshFrame.RefreshButton then
			StyleModernIconButton(ibf.RefreshFrame.RefreshButton, "R")
		end
	end
	if ahFrame.CommoditiesBuyFrame then
		local cbf = ahFrame.CommoditiesBuyFrame
		StyleFixedWidthAHButton(cbf.BackButton, "default")
		if cbf.BuyDisplay then StyleFixedWidthAHButton(cbf.BuyDisplay.BuyButton, "primary") end
		if cbf.RefreshFrame and cbf.RefreshFrame.RefreshButton then
			StyleModernIconButton(cbf.RefreshFrame.RefreshButton, "R")
		end
	end
	if ahFrame.ItemSellFrame then
		StyleFixedWidthAHButton(ahFrame.ItemSellFrame.PostButton, "primary")
	end
	if ahFrame.CommoditiesSellFrame then
		StyleFixedWidthAHButton(ahFrame.CommoditiesSellFrame.PostButton, "primary")
	end
	if ahFrame.AuctionsFrame then
		local af = ahFrame.AuctionsFrame
		StyleFixedWidthAHButton(af.CancelAuctionButton, "default")
		if af.BidFrame then StyleFixedWidthAHButton(af.BidFrame.BidButton, "default") end
		if af.BuyoutFrame then StyleFixedWidthAHButton(af.BuyoutFrame.BuyoutButton, "primary") end
		if af.RefreshFrame and af.RefreshFrame.RefreshButton then
			StyleModernIconButton(af.RefreshFrame.RefreshButton, "R")
		end
		-- Style AuctionsFrame top sub-tabs ("Auktionen" / "Gebote")
		local subTabs = af.Tabs or { _G["AuctionsFrameTab1"], _G["AuctionsFrameTab2"] }
		if subTabs and #subTabs > 0 then
			local function SyncAuctionSubTabs()
				local sel = (PanelTemplates_GetSelectedTab and PanelTemplates_GetSelectedTab(af)) or af.selectedTab or (af.displayMode) or 1
				for idx, st in ipairs(subTabs) do
					if st then
						ResizeRetailTab(st)
						SetRetailTabChecked(st, idx == sel)
						if idx > 1 and subTabs[idx - 1] then
							st:ClearAllPoints()
							st:SetPoint("LEFT", subTabs[idx - 1], "RIGHT", 4, 0)
						end
					end
				end
			end
			for idx, st in ipairs(subTabs) do
				if st and not st._aucSubTabHooked then
					st._aucSubTabHooked = true
					st:HookScript("OnClick", function()
						if PanelTemplates_SetTab then pcall(PanelTemplates_SetTab, af, idx) end
						SyncAuctionSubTabs()
					end)
				end
			end
			if af.SetDisplayMode and not af._aucSubModeHooked then
				af._aucSubModeHooked = true
				hooksecurefunc(af, "SetDisplayMode", SyncAuctionSubTabs)
			end
			af:HookScript("OnShow", SyncAuctionSubTabs)
			SyncAuctionSubTabs()
		end
	end
end

local function SetupRetailAHWindowControls(ahFrame)
	if not ahFrame or ahFrame._aucWindowControlsSetup then return end
	ahFrame._aucWindowControlsSetup = true

	pcall(ahFrame.SetMovable, ahFrame, true)
	pcall(ahFrame.SetResizable, ahFrame, true)
	if ahFrame.SetResizeBounds then
		pcall(ahFrame.SetResizeBounds, ahFrame, 830, 548, 1500, 980)
	elseif ahFrame.SetMinResize then
		pcall(ahFrame.SetMinResize, ahFrame, 830, 548)
		pcall(ahFrame.SetMaxResize, ahFrame, 1500, 980)
	end
	ahFrame._aucBaseWidth = 830
	ahFrame._aucBaseHeight = 548

	local savedW = tonumber(lib.Settings and lib.Settings.GetSetting and lib.Settings.GetSetting("core.general.ahWindowWidth"))
	local savedH = tonumber(lib.Settings and lib.Settings.GetSetting and lib.Settings.GetSetting("core.general.ahWindowHeight"))
	if savedW and savedH and savedW >= 830 and savedH >= 548 then
		pcall(ahFrame.SetSize, ahFrame, savedW, savedH)
	else
		pcall(ahFrame.SetSize, ahFrame, ahFrame._aucBaseWidth, ahFrame._aucBaseHeight)
	end

	local savedScale = tonumber(lib.Settings and lib.Settings.GetSetting and lib.Settings.GetSetting("core.general.ahWindowScale"))
	if savedScale and savedScale >= 0.75 and savedScale <= 1.75 then
		pcall(ahFrame.SetScale, ahFrame, savedScale)
	end

	ahFrame:HookScript("OnSizeChanged", function(self)
		lib.ReflowRetailAHInternalFrames(self)
	end)
	lib.ReflowRetailAHInternalFrames(ahFrame)

	local Configator = LibStub and LibStub("Configator", true)
	local UIStyle = Configator and Configator.UIStyle

	if UIStyle then
		-- Reset any legacy enlarged font size back to crisp 12pt default
		if _G.AucAdvancedData and _G.AucAdvancedData.UtilUiFontSize and _G.AucAdvancedData.UtilUiFontSize ~= 12 then
			UIStyle.SetFontSize(12)
		end
		StyleModernRetailAHChrome(ahFrame, UIStyle)
	end

	-- Bottom-right window resize & scale grip:
	-- Left-Drag: dynamically resizes window width/height and reflows all columns & rows
	-- Shift + Left-Drag: proportionally scales window and all contents (0.75x - 1.75x)
	-- Right-Click: resets window size and scale to default
	if not ahFrame._aucResizer then
		local resizer = CreateFrame("Button", "AucRetailAHResizer", ahFrame)
		resizer._aucKeepVisible = true
		resizer:SetSize(20, 20)
		resizer:SetPoint("BOTTOMRIGHT", ahFrame, "BOTTOMRIGHT", -3, 3)
		resizer:SetFrameStrata("DIALOG")
		resizer:SetFrameLevel(120)
		resizer:RegisterForClicks("RightButtonUp")
		resizer:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
		resizer:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
		resizer:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")

		local isScaling = false
		local isSizing = false
		local startScale, uipLeft, uipTop, startCursorX, startCursorY, uiEffScale

		resizer:SetScript("OnMouseDown", function(_, button)
			if button == "LeftButton" then
				if IsShiftKeyDown() then
					isScaling = true
					startScale = ahFrame:GetScale() or 1
					uipLeft = (ahFrame:GetLeft() or 100) * startScale
					uipTop = (ahFrame:GetTop() or 600) * startScale
					startCursorX, startCursorY = GetCursorPosition()
					uiEffScale = UIParent:GetEffectiveScale() or 1
				else
					isSizing = true
					ahFrame:StartSizing("BOTTOMRIGHT")
				end
			end
		end)

		resizer:SetScript("OnUpdate", function()
			if not isScaling then return end
			local curX, curY = GetCursorPosition()
			local dx = (curX - startCursorX) / uiEffScale
			local dy = (startCursorY - curY) / uiEffScale
			local baseW = ahFrame:GetWidth() or 800
			local baseH = ahFrame:GetHeight() or 538
			local scaleX = ((baseW * startScale) + dx) / baseW
			local scaleY = ((baseH * startScale) + dy) / baseH
			local newScale = math.max(0.75, math.min(1.75, (scaleX + scaleY) * 0.5))
			ahFrame:SetScale(newScale)
			ahFrame:ClearAllPoints()
			ahFrame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", uipLeft / newScale, uipTop / newScale)
		end)

		resizer:SetScript("OnMouseUp", function(_, button)
			if isSizing then
				isSizing = false
				ahFrame:StopMovingOrSizing()
				lib.ReflowRetailAHInternalFrames(ahFrame)
				if lib.Settings and lib.Settings.SetSetting then
					pcall(lib.Settings.SetSetting, "core.general.ahWindowWidth", math.floor((ahFrame:GetWidth() or 800) + 0.5))
					pcall(lib.Settings.SetSetting, "core.general.ahWindowHeight", math.floor((ahFrame:GetHeight() or 538) + 0.5))
				end
			end
			if isScaling then
				isScaling = false
				local curScale = math.floor((ahFrame:GetScale() or 1) * 100 + 0.5) / 100
				if lib.Settings and lib.Settings.SetSetting then
					pcall(lib.Settings.SetSetting, "core.general.ahWindowScale", curScale)
				end
			end
			if button == "RightButton" then
				local oldScale = ahFrame:GetScale() or 1
				local leftPos = (ahFrame:GetLeft() or 100) * oldScale
				local topPos = (ahFrame:GetTop() or 600) * oldScale
				ahFrame:SetSize(ahFrame._aucBaseWidth or 800, ahFrame._aucBaseHeight or 538)
				ahFrame:SetScale(1.0)
				ahFrame:ClearAllPoints()
				ahFrame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", leftPos, topPos)
				lib.ReflowRetailAHInternalFrames(ahFrame)
				if lib.Settings and lib.Settings.SetSetting then
					pcall(lib.Settings.SetSetting, "core.general.ahWindowWidth", 800)
					pcall(lib.Settings.SetSetting, "core.general.ahWindowHeight", 538)
					pcall(lib.Settings.SetSetting, "core.general.ahWindowScale", 1.0)
				end
			end
		end)
		resizer:SetScript("OnEnter", function(self)
			if GameTooltip then
				GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
				GameTooltip:SetText(lib.localizations("Click and drag to resize window"))
				GameTooltip:AddLine("Shift + Drag: Scale | Right-Click: Reset", 0.75, 0.75, 0.75)
				GameTooltip:Show()
			end
		end)
		resizer:SetScript("OnLeave", function()
			if GameTooltip then GameTooltip:Hide() end
		end)
		ahFrame._aucResizer = resizer
	end
end

local function EnsureTabFrameSurface(tabFrame, ahFrame)
	tabFrame:ClearAllPoints()
	tabFrame:SetParent(ahFrame)
	tabFrame:SetPoint("TOPLEFT", ahFrame, "TOPLEFT", 6, -26)
	tabFrame:SetPoint("BOTTOMRIGHT", ahFrame, "BOTTOMRIGHT", -6, 6)
	tabFrame:EnableMouse(true)
	if not tabFrame._aucSurface then
		local bg = tabFrame:CreateTexture(nil, "BACKGROUND")
		bg:SetAllPoints(tabFrame)
		bg:SetColorTexture(0.07, 0.08, 0.10, 0.98)
		tabFrame._aucSurface = bg
	end
	local baseLevel = math.max(15, (ahFrame:GetFrameLevel() or 1) + 10)
	tabFrame:SetFrameLevel(baseLevel)
	private.relevelFrame(tabFrame)
end

function lib.AddTab(tabButton, tabFrame)
	local isRetail = AucAdvanced.IsRetailAH

	if isRetail then
		local ahFrame = AuctionHouseFrame
		if not ahFrame then return end

		-- AuctionHouseFrameDisplayModeTabTemplate has parentArray="Tabs", which causes
		-- CreateFrame to append custom tabs into ahFrame.Tabs. Remove any custom tabs
		-- from ahFrame.Tabs so built-in tab iteration and anchoring never self-reference.
		tabButton._isCustomRetailTab = true
		tabButton._aucKeepVisible = true
		if ahFrame.Tabs then
			for i = #ahFrame.Tabs, 1, -1 do
				local t = ahFrame.Tabs[i]
				if t == tabButton or t._isCustomRetailTab or private.RetailTabFrames[t] then
					table.remove(ahFrame.Tabs, i)
				end
			end
			if PanelTemplates_SetNumTabs then
				pcall(PanelTemplates_SetNumTabs, ahFrame, #ahFrame.Tabs)
			end
		end

		SetupRetailAHWindowControls(ahFrame)

		for _, tab in ipairs(private.RetailTabs) do
			if tab:GetName() == tabButton:GetName() then
				return
			end
		end

		table.insert(private.RetailTabs, tabButton)
		private.RetailTabFrames[tabButton] = tabFrame

		EnsureTabFrameSurface(tabFrame, ahFrame)
		tabFrame:Hide()

		-- Tab button: parent to ahFrame
		tabButton:SetParent(ahFrame)
		tabButton:SetScript("OnShow", nil)
		tabButton:SetScript("OnEvent", nil)
		tabButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		tabButton:SetNormalFontObject(GameFontNormalSmall)
		tabButton:SetHighlightFontObject(GameFontHighlightSmall)
		tabButton:SetDisabledFontObject(GameFontHighlightSmall)
		tabButton:SetText(tabButton:GetText() or "")
		tabButton:SetFrameStrata(ahFrame:GetFrameStrata())
		tabButton:SetFrameLevel((ahFrame:GetFrameLevel() or 1) + 5)

		-- Custom checked state
		tabButton._checked = false
		tabButton.GetChecked = function(self) return self._checked end
		tabButton.SetChecked = function(self, checked) SetRetailTabChecked(self, checked) end

		-- Initialize deselected & properly sized to match native AH tabs
		ResizeRetailTab(tabButton)
		SetRetailTabChecked(tabButton, false)

		-- Preserve the module's original OnClick handler
		local moduleOnClick = tabButton:GetScript("OnClick") or tabButton.OnClick

		tabButton:SetScript("OnMouseUp", function(self, button)
			if button == "RightButton" and moduleOnClick then
				moduleOnClick(self, button)
			end
		end)

		-- Tab click handler: manages tab selection and hides built-in content
		tabButton:SetScript("OnClick", function(self, button, ...)
			if button == "RightButton" and moduleOnClick then
				moduleOnClick(self, button, ...)
				return
			end

			if ahFrame.SetDisplayMode then
				pcall(ahFrame.SetDisplayMode, ahFrame, {})
				ahFrame.displayMode = nil
			end

			-- Hide all custom tab frames and deselect all custom tabs
			lib.HideAllRetailTabs()

			-- Hide all built-in AH subframes
			lib.HideBuiltinAHContent()

			-- Deselect all built-in tabs
			if ahFrame.Tabs then
				for _, tab in ipairs(ahFrame.Tabs) do
					SetRetailTabChecked(tab, false)
				end
			end

			PlaySound(SOUNDKIT and SOUNDKIT.IG_CHARACTER_INFO_TAB or 841)

			-- Re-ensure surface & bounds before module shows frame
			EnsureTabFrameSurface(tabFrame, ahFrame)

			-- Call the module's original OnClick handler BEFORE setting checked state
			-- because moduleOnClick calls lib.HideAllRetailTabs()!
			if moduleOnClick then
				moduleOnClick(self, button, ...)
			end

			ahFrame.currentCustomTab = self
			SetRetailTabChecked(self, true)
			SyncBuiltinRetailTabStates(ahFrame)
			tabFrame:Show()
		end)

		-- Hook SetDisplayMode and built-in Tabs OnClick to re-show built-in content
		-- and hide custom content when any built-in tab is clicked
		if not private.displayModeHooked then
			private.displayModeHooked = true
			hooksecurefunc(ahFrame, "SetDisplayMode", function(_, mode)
				if mode and type(mode) == "table" and #mode > 0 then
					lib.HideAllRetailTabs()
					lib.RestoreBuiltinAHContent()
					ahFrame.currentCustomTab = nil
					SyncBuiltinRetailTabStates(ahFrame)
				end
			end)
			if PanelTemplates_SetTab then
				hooksecurefunc("PanelTemplates_SetTab", function(frame)
					if frame == ahFrame then
						SyncBuiltinRetailTabStates(ahFrame)
					end
				end)
			end
			if ahFrame.Tabs then
				for idx, builtinTab in ipairs(ahFrame.Tabs) do
					builtinTab:HookScript("OnClick", function(self)
						local wasCustom = ahFrame.currentCustomTab ~= nil
						lib.HideAllRetailTabs()
						lib.RestoreBuiltinAHContent()
						ahFrame.currentCustomTab = nil
						if wasCustom and self.displayMode and ahFrame.SetDisplayMode then
							pcall(ahFrame.SetDisplayMode, ahFrame, self.displayMode)
						end
						if PanelTemplates_SetTab then
							pcall(PanelTemplates_SetTab, ahFrame, idx)
						end
						ahFrame.selectedTab = idx
						SyncBuiltinRetailTabStates(ahFrame)
					end)
				end
			end
		end

		-- Position cleanly in the same row right after the built-in tabs (matching LibAHTab)
		local tabCount = #private.RetailTabs
		tabButton:SetID(tabCount)
		PositionRetailTabs(ahFrame)
		tabButton:Show()

		-- Hook ahFrame show/hide to manage custom tabs
		if not private.closeHooked then
			private.closeHooked = true
			ahFrame:HookScript("OnShow", function()
				ahFrame.currentCustomTab = nil
				PositionRetailTabs(ahFrame)
				for _, tab in ipairs(private.RetailTabs) do
					SetRetailTabChecked(tab, false)
					tab:Show()
				end
				SyncBuiltinRetailTabStates(ahFrame)
				lib.ReflowRetailAHInternalFrames(ahFrame)
			end)
			ahFrame:HookScript("OnHide", function()
				lib.HideAllRetailTabs()
				lib.RestoreBuiltinAHContent()
				for _, tab in ipairs(private.RetailTabs) do
					SetRetailTabChecked(tab, false)
					tab:Hide()
				end
				ahFrame.currentCustomTab = nil
			end)
		end
	else
		local tabCount = 1
		while (_G["AuctionFrameTab"..(tabCount)]) do
			if _G["AuctionFrameTab"..(tabCount)]:GetName() == tabButton:GetName() then
				lib.Print("Tab with that name already exists")
				return
			end
			tabCount = tabCount + 1
		end

		local tabIndex = 1
		while (_G["AuctionFrameTab"..(tabIndex)] and
		       _G["AuctionFrameTab"..(tabIndex)]:GetName() ~= "AuctionFrameTabUtilBeanCounter") do
			tabIndex = tabIndex + 1
		end

		for index = tabCount, tabIndex + 1, -1 do
			_G["AuctionFrameTab"..(index)] = _G["AuctionFrameTab"..(index - 1)]
			_G["AuctionFrameTab"..(index)]:SetID(index)
		end

		if not tabFrame:GetParent() then
			tabFrame:SetParent(AuctionFrame)
		end
		tabFrame:SetPoint("TOPLEFT", "AuctionFrame", "TOPLEFT", 0, 0)
		private.relevelFrame(tabFrame)

		_G["AuctionFrameTab"..tabIndex] = tabButton
		if not tabButton:GetParent() then
			tabButton:SetParent(AuctionFrame)
		end
		tabButton:SetPoint("TOPLEFT", _G["AuctionFrameTab"..(tabIndex - 1)]:GetName(), "TOPRIGHT", -8, 0)
		tabButton:SetID(tabIndex)
		tabButton:Show()

		if (tabIndex < tabCount) then
			local nextTabButton = _G["AuctionFrameTab"..(tabIndex + 1)]
			nextTabButton:SetPoint("TOPLEFT", tabButton:GetName(), "TOPRIGHT", -8, 0)
		end

		PanelTemplates_SetNumTabs(AuctionFrame, tabCount)
	end
end

function lib.RemoveTab(tabButton, tabFrame)
	local isRetail = AucAdvanced.IsRetailAH

	if isRetail then
		for i, tab in ipairs(private.RetailTabs) do
			if tab:GetName() == tabButton:GetName() then
				table.remove(private.RetailTabs, i)
				private.RetailTabFrames[tab] = nil
				break
			end
		end
		if AuctionHouseFrame then
			PositionRetailTabs(AuctionHouseFrame)
		end
		tabFrame:Hide()
		tabButton:Hide()
	else
		local tabCount = 0
		while (_G["AuctionFrameTab"..(tabCount+1)]) do
			tabCount = tabCount + 1
		end

		local tabIndex, tabFound = 1
		while _G["AuctionFrameTab"..(tabIndex)] do
			if _G["AuctionFrameTab"..(tabIndex)]:GetName() == tabButton:GetName() then
				tabFound = tabIndex
				break
			end
			tabIndex = tabIndex + 1
		end

		if not tabFound then return end

		if tabFound and (tabFound < tabCount) then
			local nextTabButton = _G["AuctionFrameTab"..(tabFound + 1)]
			nextTabButton:SetPoint("TOPLEFT", _G["AuctionFrameTab"..(tabFound - 1)]:GetName(), "TOPRIGHT", -8, 0)
		end

		_G["AuctionFrameTab"..(tabFound)] = nil
		for index = tabFound, tabCount do
			local tab = _G["AuctionFrameTab"..(index + 1)]
			if tab then
				_G["AuctionFrameTab"..(index)] = tab
				_G["AuctionFrameTab"..(index)]:SetID(index)
			else
				_G["AuctionFrameTab"..(index)] = nil
			end
		end

		tabFrame:Hide()
		tabButton:Hide()
		PanelTemplates_SetNumTabs(AuctionFrame, tabCount - 1)
	end
end

-- Table management functions:
local function replicate(source, depth, history)
	if type(source) ~= "table" then return source end
	assert(depth==nil or tonumber(depth), "Unknown depth: " .. tostring(depth))
	if not depth then depth = 0 history = {} end
	assert(history, "Have depth but without history")
	assert(depth < 100, "Structure is too deep")
	local dest = {} history[source] = dest
	for k, v in pairs(source) do
		if type(v) == "table" then
			if history[v] then dest[k] = history[v]
			else dest[k] = replicate(v, depth+1, history) end
		else dest[k] = v end
	end
	return dest
end
local function empty(item)
	if type(item) == 'table' then wipe(item) end
end
local function fill(item, ...)
	if type(item) ~= 'table' then return end
	wipe(item)
	local n = select('#', ...)
	for i = 1,n do item[i] = select(i, ...) end
end
-- End table management functions

-- Old functions (compatability)
lib.Recycle = function() end
lib.Acquire = function(...) return {...} end
lib.Clone = replicate
lib.Scrub = empty
-- New functions
lib.Replicate = replicate
lib.Empty = empty
lib.Fill = fill

--[[
Functions for establishing a new copy of the library.
Recommended method:

  local libType, libName = "myType", "myName"
  local lib,parent,private = AucAdvanced.NewModule(libType, libName)
  if not lib then return end
  local aucPrint,decode,_,_,replicate,empty,get,set,default,debugPrint,fill,_TRANS = AucAdvanced.GetModuleLocals()

--]]

do -- Module Functions
	-- local variables for module functions
	local moduleNameLower = {}
	local moduleSortedLists = {All = {}, Util = {}, Stat = {}, Match = {}, Filter = {}}
	local moduleNameLookups = {All = {}, Util = {}, Stat = {}, Match = {}, Filter = {}}
	local moduleNameLookupAll = moduleNameLookups.All -- local ref to this entry for quick lookup by GetModule
	local moduleTypeLookup = { -- used to validate module types (libType)
		filter = "Filter",
		Filter = "Filter",
		match = "Match",
		Match = "Match",
		stat = "Stat",
		Stat = "Stat",
		util = "Util",
		Util = "Util",
	}
	local moduleOnLoadNames
	local moduleLoadCallbacks

	-- constants
	local MODULE_LOADED = "^loaded"

	function private.checkAuthorizedModules()
		-- check the publicly accessible modules tables, notifying of any modules that have been inserted directly
		-- called once per session, when auctionhouse first opened
		-- ### temp function for debugging
		private.checkAuthorizedModules = nil
		for typeName, typeTable in pairs(lib.Modules) do
			for moduleName, moduleTable in pairs(typeTable) do
				if not moduleNameLookupAll[moduleName] then
					-- note: using geterrorhandler() instead of error here allows us to report multiple entries
					-- and avoids halting the processor event
					geterrorhandler()(format("Auctioneer has detected unauthorized entry %s(%s) in AucAdvanced.Modules.%s",
						tostring(moduleName), type(moduleTable), typeName))
				end
			end
		end
	end

	-- Functions for special access by other Core modules
	function internalUtil.GetModuleForName(addonName)
		-- Allows CoreMain OnLoad handler to match an AddOn name to the related module, if one exists
		-- Must *not* be called from anywhere else
		-- The match is based on the AddOn name (5th parameter) supplied to NewModule
		if not moduleOnLoadNames then return end
		local module = moduleOnLoadNames[addonName] -- expect addonName to be all lowercase
		if not module then return end
		moduleOnLoadNames[addonName] = nil
		if not next(moduleOnLoadNames) then moduleOnLoadNames = nil end -- delete lookup table if empty
		return module
	end

	function internalUtil.SendModuleCallbacks(module)
		-- Specified module has fully loaded:
		-- Flag it as loaded
		module[MODULE_LOADED] = true
		-- Flush the SPM cache
		internalUtil.ResetSPMArray()
		-- Send all the callbacks
		if not moduleLoadCallbacks then return end
		local moduleName = module:GetName():lower()
		local list = moduleLoadCallbacks[moduleName]
		if not list then return end
		moduleLoadCallbacks[moduleName] = nil
		if not next(moduleLoadCallbacks) then moduleLoadCallbacks = nil end -- delete lookup table if empty
		for _, callback in ipairs(list) do
			pcall(callback, module)
		end
	end

	-- function to store references to the module in multiple tables, for fast retrieval by GetModule and GetAllModules
	local function UpdateModuleTables(moduleLib, moduleName, moduleType, lowerName)
		-- update the internal lookup tables
		moduleNameLower[lowerName] = moduleLib
		moduleNameLookups.All[moduleName] = moduleLib
		moduleNameLookups[moduleType][moduleName] = moduleLib

		-- sorted lists - used by GetAllModules so as to always return modules in a specific order
		-- sublists are sorted by lowercase name (ascending)
		local tpos
		local typeList = moduleSortedLists[moduleType]
		for index, module in ipairs(typeList) do
			if lowerName < module.GetName():lower() then
				tpos = index
				break
			end
		end
		tpos = tpos or #typeList + 1
		tinsert(typeList, tpos, moduleLib)
		-- the All list is sorted first by module type (descending) then by lower name (ascending, as in the sublists)
		local apos
		local allList = moduleSortedLists.All
		for index, module in ipairs(allList) do
			local curtype = module.GetLibType()
			if moduleType > curtype then
				apos = index
				break
			elseif moduleType == curtype then
				-- we already found the insertion point based on lowerName - tpos
				apos = index + tpos - 1
				break
			end
		end
		tinsert(allList, apos or #allList + 1, moduleLib)

		-- install in public table for direct access by other mods (compatibility)
		lib.Modules[moduleType][moduleName] = moduleLib
	end

	--[[

	Usage:
	  local lib,parent[,private] = AucAdvanced.NewModule(libtype, libName [, libTable, noExtras, addonName])

	  libType must be one of "Filter" "Match" "Stat" "Util"
	  libName must be unique (and may not be one of "Filter" "Match" "Stat" "Util")
	  libTable (optional) table to be used as the lib; this may already contain entries
	  noExtras (optional) boolean: true will prevent the creation of certain 'convenience' entries (currently only the Private subtable)
	  addonName (optional) if provided must exactly match the name of the AddOn calling this function
	    (not needed if the AddOn name matches the Module name, according to the "Auc-libType-libName" convention)

	  Note: the caller must always check the return return from NewModule, and abort loading if it is nil

	--]]
	if not lib.ABORTLOAD then -- don't install if there is an error condition
		function lib.NewModule(libType, libName, libTable, noExtras, addonName)
			local tmp = moduleTypeLookup[libType] -- use a temp variable so we can report libType in the error message
			if not tmp then
				error("Invalid libType specified for NewModule: "..tostring(libType), 2)
			end
			libType = tmp
			if type(libName) ~= "string" then
				error("Module name must be a string for NewModule", 2)
			end
			if libTable and type(libTable) ~= "table" then
				error("Invalid module table provided to NewModule", 2)
			end
			local lowerName = libName:lower()
			if moduleNameLower[lowerName] then
				error("Module name '"..lowerName.."' already in use by NewModule", 2)
			end
			if moduleTypeLookup[lowerName] then
				-- block using one of the libTypes as a name (may add more reserved names in future)
				error("Module name "..lowerName.." is not a valid name", 2)
			end
			local typeTable = lib.Modules[libType] -- ### temp
			assert(typeTable) -- ### temp
			assert(not typeTable[libName]) -- ### temp
			if addonName then
				if type(addonName) ~= "string" then
					error("AddOn name must be a string or nil for NewModule", 2)
				end
				addonName = addonName:lower()
				if moduleOnLoadNames and moduleOnLoadNames[addonName] then
					error("AddOn name already registered with NewModule", 2)
				end
				-- if addonName matches the Auc naming convention we do not need to take any special action with it
				-- also explicitly block "auc-advanced" as only Core modules should use that name, and they get special handling
				if addonName == "auc-advanced" or addonName == strjoin("-", "Auc", libType, libName):lower() then
					addonName = nil
				end
			end

			local module = libTable or {}
			module.libName = libName
			module.libType = libType
			module.GetName = function() return libName end
			module.GetLibType = function() return libType end
			if not module.GetLocalName then -- don't create if it already exists
				module.GetLocalName = module.GetName
			end
			if not noExtras and not module.Private then
				module.Private = {} -- assign a private table if it is wanted and does not already exist
			end

			UpdateModuleTables(module, libName, libType, lowerName)
			if addonName then
				if not moduleOnLoadNames then
					moduleOnLoadNames = {}
				end
				moduleOnLoadNames[addonName] = module
			end

			private.resetPriceModels()
			internalUtil.ResetSPMArray()

			private.newmoduleCheckName = libName -- ### temp
			lib.SendProcessorMessage("newmodule", libType, libName)
			private.newmoduleCheckName = nil -- ### temp
			return module, lib, module.Private
		end
	end

	--[[

	Usage:
	  local aucPrint,decode,_,_,replicate,empty,get,set,default,debugPrint,fill,_TRANS = AucAdvanced.GetModuleLocals()

	-- ]]
	function lib.GetModuleLocals()
		return lib.Print, lib.DecodeLink,
		lib.Recycle, lib.Acquire, lib.Replicate, lib.Empty,
		lib.Settings.GetSetting, lib.Settings.SetSetting, lib.Settings.SetDefault,
		lib.Debug.DebugPrint, lib.Fill, lib.localizations
	end

	--[[

	Usage:
	  local libCopy = AucAdvanced.GetModule(libName) -- short form
	  local libCopy = AucAdvanced.GetModule(libType, libName, having)

	  libName: (required) module name (either correct case or lowercase)
	  libType: (optional) one of the valid module types (either correct case or lowercase)
	  having: (optional) checks that the module has this method (can also find other types of key)

	  No errors are thrown for invalid parameters, just a nil return

	--]]
	function lib.GetModule(libType, libName, having)
		if libName then
			local module = moduleNameLookupAll[libName] or moduleNameLower[libName]
			if module and (not having or module[having]) then
				if libType then
					if module.GetLibType() == moduleTypeLookup[libType] then
						return module
					end
				else
					return module
				end
			end
		else
			-- 'libType' is really the module name
			return moduleNameLookupAll[libType] or moduleNameLower[libType]
		end
	end

	--[[

	Usage:
	  local moduleList = AucAdvanced.GetAllModules(having, libType, useTable, mode)
	  local moduleLib = AucAdvanced.GetAllModules(having, libType, libName) -- deprecated form - included for compatibility

	  All parameters are optional
	  having: name of method that modules should contain (or any other key)
	  libType: one of the valid modules types (either correct case or lowercase)
	  useTable: function will use, and return, this table instead of creating an empty table
		(if useTable is not empty, new entries will be inserted after the existing ones)
	  mode: if provided, modules will be inserted as key = engineLib pairs (instead of an indexed list)
		mode = 1 : keys are module names

	  (deprecated) libName: a module name (correct case or lowercase) - only this lib will be returned (not a list)
		should use AucAdvanced.GetModule(libType, libName, having) instead

	  moduleList is a table containing a list of moduleLibs matching the specified parameters
		in a specific order: sorted by libType-descending then lowerName-ascending (unless key mode was specified)
		if no modules matching the parameters are found the table will be empty (or unchanged if useTable was supplied)

	  Returns nil if any parameters were invalid

	--]]
	function lib.GetAllModules(having, findSystem, useTable, mode)
		local modules

		if useTable then
			local t = type(useTable)
			if t == "table" then
				modules = useTable
			elseif t == "string" then
				lib.API.ShowDeprecationAlert("GetModule")
				return lib.GetModule(findSystem, useTable, having)
			else
				return
			end
		else
			modules = {}
		end

		if findSystem then
			findSystem = moduleTypeLookup[findSystem]
			if not findSystem then return end
		else
			findSystem = "All"
		end

		if mode == 1 then
			-- key mode: entries are name~lib pairs
			if having then
				for name, module in pairs(moduleNameLookups[findSystem]) do
					if module[having] then
						modules[name] = module
					end
				end
			else
				for name, module in pairs(moduleNameLookups[findSystem]) do
					modules[name] = module
				end
			end
		else -- default, mode == 0
			-- sorted list mode
			if having then
				for _, module in ipairs(moduleSortedLists[findSystem]) do
					if module[having] then
						tinsert(modules, module)
					end
				end
			else
				for _, module in ipairs(moduleSortedLists[findSystem]) do
					tinsert(modules, module)
				end
			end
		end

		return modules
	end

	--[[

	Usage:
	  AucAdvanced.RegisterModuleCallback(moduleName, callbackFunction)

	  Used when you want to access features of another module, which will not be available until that module has fully loaded
	  Particularly useful when your module may load before the module you want to access

	  callbackFunction should be of the form:
		function callbackFunction(moduleLib)

	  Note: if the module is already loaded the callback will be triggered before this function returns

	--]]
	function lib.RegisterModuleCallback(moduleName, callback)
		if type(moduleName) ~= "string" then
			error("Module name must for a string for RegisterModuleCallback", 2)
		end
		if type(callback) ~= "function" then
			error("Callback must be a function for RegisterModuleCallback", 2)
		end
		moduleName = moduleName:lower()

		local module = lib.GetModule(moduleName)
		if module and module[MODULE_LOADED] then
			-- already loaded, fire callback immediately
			pcall(callback, module)
			return
		end

		if not moduleLoadCallbacks then
			moduleLoadCallbacks = {}
		end
		local list = moduleLoadCallbacks[moduleName]
		if not list then
			list = {}
			moduleLoadCallbacks[moduleName] = list
		end
		tinsert(list, callback)
	end

	--[[

	Usage:
	  AucAdvanced.NotifyModuleLoaded(moduleLib [, loadName])

	  Optional function to flag a module as Loaded, where the auto-detection features do not work
	  i.e. where the AddOn name does not match the Auc-LibType-LibName convention, and was not supplied to NewModule

	  Should *only* be called by the AddOn that created the module

	--]]
	function lib.NotifyModuleLoaded(module, loadName)
		if module[MODULE_LOADED] then return end

		loadName = loadName or module:GetName() -- if loadName not provided, use module name instead
		lib.SendProcessorMessage("load", loadName:lower()) -- always lowercase, to emulate CoreMain OnLoad

		internalUtil.SendModuleCallbacks(module) -- also sets Loaded flag
	end

end -- end of Module Functions


local spmArray = {}
if not lib.ABORTLOAD then -- don't install function if there is an error condtion
	function lib.SendProcessorMessage(spmMsg, ...)
		local spmp = spmArray[spmMsg]
		if (spmp) then
			for i=1,#spmp do
				local x = spmp[i]
				local f = x.Func

				local good,msg=pcall(f, spmMsg, ...)
				if not good then
					msg = "Error trapped for Processor message '"..spmMsg.."' in module "..x.Name..":\n"..msg
					lib.Debug.DebugPrint(msg, "SendProcessorMessage", "Processor Error in "..x.Name, 0, "Debug")
					geterrorhandler()(msg)
				end
			end
		else
			spmp = {}
			spmArray[spmMsg] = spmp

			local modules = lib.GetAllModules("Processors")
			for pos, engineLib in ipairs(modules) do
				local f = engineLib.Processors[spmMsg]
				if f then
					local x = {}
					x.Name = engineLib.GetName()
					if (spmMsg=="tooltip") then
						local f1 = f
						x.Func = function(spmMsg, ...)
							-- TODO: Make these defaults configurable
							tooltip:SetColor(0.3, 0.9, 0.8)
							tooltip:SetMoneyAsText(false)
							tooltip:SetEmbed(false)
							f1(spmMsg, ...)
						end
					else
						x.Func = f
					end
					tinsert(spmp, x)
					local good,msg=pcall(f, spmMsg, ...)
					if not good then
						msg = "Error trapped for Processor message '"..spmMsg.."' in module "..x.Name..":\n"..msg
						lib.Debug.DebugPrint(msg, "SendProcessorMessage", "Processor Error in "..x.Name, 0, "Debug")
						geterrorhandler()(msg)
					end
				end
			end

			modules = lib.GetAllModules("Processor")
			for pos, engineLib in ipairs(modules) do
				if (not engineLib.Processors) then
					local x = {}
					x.Name = engineLib.GetName()
					x.Func = engineLib.Processor
					lib.Debug.DebugPrint("Module "..x.Name.." using deprecated 'Processor' function for "..(spmMsg or "Unknown").." processor messages.", "SendProcessorMessage", "Deprecated Function Seen in "..x.Name, 0, "Warning")
					tinsert(spmp, x)
					local good,msg=pcall(engineLib.Processor, spmMsg, ...)
					if not good then
						msg = "Error trapped for Processor message '"..spmMsg.."' in module "..x.Name..":\n"..msg
						lib.Debug.DebugPrint(msg, "SendProcessorMessage", "Processor Error in "..x.Name, 0, "Debug")
						geterrorhandler()(msg)
					end
				end
			end
		end
	end
end

function internalUtil.ResetSPMArray() -- make available to CoreMain
	wipe(spmArray)
end

-- Returns the tooltip helper
function lib.GetTooltip()
	return tooltip
end

-- Turns a copper amount into colorized text
function lib.Coins(amount, graphic)
	return (tooltip:Coins(amount, graphic))
end

-- Creates a new coin object
function lib.CreateMoney(height)
	return (tooltip:CreateMoney(height))
end

lib.RegisterRevision("$URL: Auc-Advanced/CoreUtil.lua $", "$Rev: 6733 $")
lib.CoreFileCheckOut("CoreUtil")
