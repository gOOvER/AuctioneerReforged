--[[
	Auctioneer Reforged
	Version: 1.0.0
	Author: gOOvER

	This is an addon for World of Warcraft that adds statistical history to the auction data that is collected
	when the auction is scanned, so that you can easily determine what price
	you will be able to sell an item for at auction or at a vendor whenever you
	mouse-over an item in the game

	License:
		This program is free software; you can redistribute it and/or
		modify it under the terms of the GNU General Public License
		as published by the Free Software Foundation; either version 3
		of the License, or (at your option) any later version.
]]

AucAdvanced = {
	Modules = {Filter={}, Match={}, Stat={}, Util={}},
	Data = {},
	Libraries = {},
	Debug = {},
	API = {},
	Buy = {},
	Config = {},
	Post = {},
	Resources = {},
	Scan = {},
	Settings = {},
}
-- Note: Due to the way AucAdvanced.Const is constructed it is intalled in CoreConst.lua
local lib = AucAdvanced

-- Manifest Constants
local DEV_VERSION = "1.0.0"
local MINIMUM_TOC = 11300
local MINIMUM_CLIENT = "1.13.0"
local MINIMUM_BUILD = nil


-- Core File checking system: used to detect critical files that fail to load (i.e. due to lua errors while loading) - including this file!
-- Place AucAdvanced.CoreFileCheckIn(filename) at the start of the file, after checking for AucAdvanced, but before any checks for ABORTLOAD
-- Place AucAdvanced.CoreFileCheckOut(filename) at the very end of the file, preferably the last line of code
-- CoreMain will call CoreFileCheckOut() with no filename to finalize the check-in/out process, just before "gameactive"
local pendingCoreFile
lib.CoreFileCheckIn = function(filename)
	if pendingCoreFile then
		if not lib.ABORTLOAD then
			lib.ABORTLOAD = "Core file failed to load correctly: "..pendingCoreFile
		end
	end
	pendingCoreFile = filename
end
lib.CoreFileCheckOut = function(filename)
	if pendingCoreFile ~= filename then -- something went wrong
		if not lib.ABORTLOAD then
			lib.ABORTLOAD = "Core file failed to load correctly: "..(pendingCoreFile or filename or "Unknown")
		end
	end
	pendingCoreFile = nil
	if not filename then -- final check, functions not needed after this
		lib.CoreFileCheckIn = nil
		lib.CoreFileCheckOut = nil
	end
end
lib.CoreFileCheckIn("CoreManifest") -- check CoreManifest in as early as possible

-- Version checking
lib.Version = "1.0.0"
if lib.Version:byte(1) == 60 then -- 60 = '<'
	lib.Version = DEV_VERSION
end
local major, minor, release, revision = strsplit(".", lib.Version)
lib.MajorVersion = major
lib.MinorVersion = minor
lib.RelVersion = release
lib.Revision = revision

-- Single instance of a 'no operation' dummy function
lib.NOPFUNCTION = function() end
-- Dummy function that returns the first parameter
lib.RETFUNCTION = function(x) return x end

-- Check TOC version and determine client flavor
local _, build, _, tocVersion = GetBuildInfo()
tocVersion = tonumber(tocVersion) or 0
if tocVersion > 0 and tocVersion < MINIMUM_TOC or (MINIMUM_BUILD and tonumber(build) < MINIMUM_BUILD) then
	print("Auctioneer Reforged requires game client version "..MINIMUM_CLIENT.." or higher.")
	lib.ABORTLOAD = "Incorrect WoW client version"
end
if tocVersion > 0 and tocVersion < 60000 then
	if tocVersion == 16001 then
		lib.Classic = 1 -- Forever / Camelot
	elseif tocVersion >= 50000 then
		lib.Classic = 5 -- Mists Classic
	elseif tocVersion >= 40000 then
		lib.Classic = 4 -- Cataclysm Classic
	elseif tocVersion >= 30000 then
		lib.Classic = 3 -- Wrath Classic
	elseif tocVersion >= 20000 then
		lib.Classic = 2 -- Burning Crusade Classic
	else
		lib.Classic = 1 -- Classic Era
	end
end

-- Native Event & AddOn Hook Dispatcher (replaces legacy Stubby)
do
	local hookFrame = CreateFrame("Frame")
	local addonHooks = {}
	local eventHooks = {}
	local isAddOnLoaded = (C_AddOns and C_AddOns.IsAddOnLoaded) or IsAddOnLoaded or function() return false end

	hookFrame:RegisterEvent("ADDON_LOADED")
	hookFrame:SetScript("OnEvent", function(_, event, arg1, ...)
		if event == "ADDON_LOADED" and type(arg1) == "string" then
			local list = addonHooks[arg1:lower()]
			if list then
				for id, fn in pairs(list) do
					pcall(fn, arg1)
				end
			end
		end
		local evList = eventHooks[event]
		if evList then
			for id, fn in pairs(evList) do
				pcall(fn, {}, event, arg1, ...)
			end
		end
	end)

	function lib.RegisterAddOnHook(addonName, hookId, callback)
		if type(addonName) ~= "string" or type(callback) ~= "function" then return end
		local key = addonName:lower()
		addonHooks[key] = addonHooks[key] or {}
		addonHooks[key][hookId or callback] = callback
		if isAddOnLoaded(addonName) or _G[addonName] then
			pcall(callback, addonName)
		end
	end

	function lib.UnregisterAddOnHook(addonName, hookId)
		if type(addonName) ~= "string" then return end
		local key = addonName:lower()
		if addonHooks[key] and hookId then
			addonHooks[key][hookId] = nil
		end
	end

	function lib.RegisterEventHook(eventName, hookId, callback)
		if type(eventName) ~= "string" or type(callback) ~= "function" then return end
		if not eventHooks[eventName] then
			eventHooks[eventName] = {}
			pcall(hookFrame.RegisterEvent, hookFrame, eventName)
		end
		eventHooks[eventName][hookId or callback] = callback
	end

	function lib.UnregisterEventHook(eventName, hookId)
		if type(eventName) ~= "string" or not eventHooks[eventName] then return end
		if hookId then
			eventHooks[eventName][hookId] = nil
		end
		if not next(eventHooks[eventName]) then
			eventHooks[eventName] = nil
			pcall(hookFrame.UnregisterEvent, hookFrame, eventName)
		end
	end
end

-- Test load libraries & provide lightweight no-op shims for removed legacy LibRevision / DebugLib
local LibRevision, DebugLib, Configator, Babylonian, TipHelper, LibDataBroker, LibDBIcon
if LibStub then
	LibRevision = LibStub("LibRevision", true)
	if not LibRevision then
		LibRevision = LibStub:NewLibrary("LibRevision", 99)
		if LibRevision then
			function LibRevision:Set(path, revision)
				return nil, path, tonumber(revision and revision:match("%d+")) or 0
			end
			function LibRevision:Get() return {} end
		end
	end
	DebugLib = LibStub("DebugLib", true)
	if not DebugLib then
		DebugLib = LibStub:NewLibrary("DebugLib", 99)
		if DebugLib then
			DebugLib.Level = {
				Critical = "Critical",
				Error = "Error",
				Warning = "Warning",
				Notice = "Notice",
				Info = "Info",
				Debug = "Debug",
			}
			DebugLib.DebugPrint = lib.NOPFUNCTION
			DebugLib.DebugPrintQuick = lib.NOPFUNCTION
			DebugLib.Assert = assert
			DebugLib.Dump = function(v) return tostring(v) end
			local debugObj = setmetatable({
				Dump = function(_, ...) return tostring(...) end
			}, {
				__call = lib.NOPFUNCTION
			})
			setmetatable(DebugLib, {
				__call = function()
					return debugObj, assert, lib.NOPFUNCTION
				end
			})
		end
	end
	Configator = LibStub("Configator", true)
	Babylonian = LibStub("Babylonian", true)
	TipHelper = LibStub("nTipHelper:1", true)
	LibDataBroker = LibStub("LibDataBroker-1.1", true)
	LibDBIcon = LibStub("LibDBIcon-1.0", true)
else
	if not lib.ABORTLOAD then lib.ABORTLOAD = "Missing library: LibStub" end
end
-- Check essential libraries
if not (Configator and Babylonian and TipHelper) then
	if not lib.ABORTLOAD then -- only report error if not already aborting load
		local missing = ""
		if not Configator then
			missing = missing.." Configator"
		end
		if not Babylonian then
			missing = missing.." Babylonian"
		end
		if not TipHelper then
			missing = missing.." Tiphelper"
		end
		lib.ABORTLOAD = "Missing library(s):"..missing
		geterrorhandler()("Auctioneer was unable to load one or more libraries:"..missing)
	end
end

lib.Libraries.LibRevision = LibRevision
lib.Libraries.DebugLib = DebugLib
lib.Libraries.Configator = Configator
lib.Libraries.Babylonian = Babylonian
lib.Libraries.TipHelper = TipHelper
lib.Libraries.LibDataBroker = LibDataBroker
lib.Libraries.LibDBIcon = LibDBIcon

-- Auctioneer's revision information functions

local versionPrefix = lib.MajorVersion.."."..lib.MinorVersion.."."..lib.RelVersion.."."
lib.moduledetail = {}
lib.revisions = {}
lib.distribution = {}

lib.RegisterRevision = lib.NOPFUNCTION

function lib.GetCurrentRevision()
	return 0, "AuctioneerReforged"
end

function lib.GetRevisionList()
	return lib.revisions
end

function lib.GetDistributionList()
	return lib.distribution
end

-- Auctioneer's debug functions
lib.Debug.DebugPrint = lib.NOPFUNCTION
lib.Debug.Level = DebugLib and DebugLib.Level or {}
lib.Debug.Assert = assert

function lib.ValidateInstall()
	if lib.ABORTLOAD then
		return nil, lib.ABORTLOAD
	end
	return lib.Resources and lib.Resources.Active
end

-- Native Blizzard Options Menu (ESC -> Options -> AddOns) integration
do
	local registeredPanels = {}
	local rootCategory = nil

	function lib.RegisterBlizzardOptionsPanel(name, description, onOpenCallback, isRoot)
		if not name or registeredPanels[name] then return end
		registeredPanels[name] = true

		local panel = CreateFrame("Frame", nil, UIParent)
		panel.name = name
		if not isRoot then
			panel.parent = "Auctioneer Reforged"
		end

		local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		title:SetPoint("TOPLEFT", 16, -16)
		title:SetText(name .. " (v" .. (lib.Version or "1.0.0") .. ")")

		local desc = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
		desc:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
		desc:SetPoint("RIGHT", panel, "RIGHT", -32, 0)
		desc:SetJustifyH("LEFT")
		desc:SetJustifyV("TOP")
		desc:SetText(description or "")

		if type(onOpenCallback) == "function" then
			local btn = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
			btn:SetSize(200, 26)
			btn:SetPoint("TOPLEFT", desc, "BOTTOMLEFT", 0, -16)
			btn:SetText(CONFIGURATION or "Open Configuration")
			btn:SetScript("OnClick", function()
				onOpenCallback()
			end)
		end

		if Settings and Settings.RegisterCanvasLayoutCategory then
			if isRoot or not rootCategory or not Settings.RegisterCanvasLayoutSubcategory then
				local category = Settings.RegisterCanvasLayoutCategory(panel, name)
				category.ID = name
				Settings.RegisterAddOnCategory(category)
				if isRoot then
					rootCategory = category
				end
			else
				local subcategory = Settings.RegisterCanvasLayoutSubcategory(rootCategory, panel, name)
				subcategory.ID = name
			end
		elseif InterfaceOptions_AddCategory then
			InterfaceOptions_AddCategory(panel)
		end
	end
end

lib.CoreFileCheckOut("CoreManifest")
