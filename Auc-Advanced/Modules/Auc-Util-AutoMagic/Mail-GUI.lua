--[[
	Auctioneer - AutoMagic Utility module
	Version: 2.5.6755 (SwimmingSeadragon)
	Revision: $Id: Mail-GUI.lua 6755 2022-01-25 11:42:44Z none $
	URL: 

	AutoMagic is an Auctioneer module which automates mundane tasks for you.

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

local lib = AucAdvanced.Modules.Util.AutoMagic
if not lib then return end
local print,decode,_,_,replicate,empty,get,set,default,debugPrint,fill,_TRANS = AucAdvanced.GetModuleLocals()
local AppraiserValue, DisenchantValue, ProspectValue, VendorValue, bestmethod, bestvalue, runstop, _

---------------------------------------------------------
-- Mail Interface
---------------------------------------------------------
lib.ammailgui = CreateFrame("Frame", "", UIParent, BackdropTemplateMixin and "BackdropTemplate"); lib.ammailgui:Hide()
function lib.makeMailGUI()
	-- Set frame visuals
	-- [name of frame]:SetPoint("[relative to point on my frame]","[frame we want to be relative to]","[point on relative frame]",-left/+right, -down/+up)
	lib.ammailgui:ClearAllPoints()
	lib.ammailgui:SetPoint("CENTER", UIParent, "BOTTOMLEFT", get("util.automagic.ammailguix"), get("util.automagic.ammailguiy"))

	--Don't need to recreate duplicate frames on each mail box open.
	if lib.ammailgui.Drag then return end

	local Configator = LibStub and LibStub("Configator", true)
	local UIStyle = Configator and Configator.UIStyle

	lib.ammailgui:SetFrameStrata("DIALOG")
	lib.ammailgui:SetHeight(88)
	lib.ammailgui:SetWidth(360)
	if UIStyle then
		UIStyle.StyleWindow(lib.ammailgui, true)
	else
		lib.ammailgui:SetBackdrop({
			bgFile = "Interface/Tooltips/UI-Tooltip-Background",
			edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
			tile = true, tileSize = 32, edgeSize = 32,
			insets = { left = 9, right = 9, top = 9, bottom = 9 }
		})
		lib.ammailgui:SetBackdropColor(0,0,0, 0.8)
	end
	lib.ammailgui:EnableMouse(true)
	lib.ammailgui:SetMovable(true)
	lib.ammailgui:SetClampedToScreen(true)

	-- Make highlightable drag bar
	lib.ammailgui.Drag = CreateFrame("Button", "", lib.ammailgui)
	lib.ammailgui.Drag:SetPoint("TOPLEFT", lib.ammailgui, "TOPLEFT", 10,-5)
	lib.ammailgui.Drag:SetPoint("TOPRIGHT", lib.ammailgui, "TOPRIGHT", -10,-5)
	lib.ammailgui.Drag:SetHeight(6)
	lib.ammailgui.Drag:SetHighlightTexture("Interface\\FriendsFrame\\UI-FriendsFrame-HighlightBar")
	lib.ammailgui.Drag:SetScript("OnMouseDown", function() lib.ammailgui:StartMoving() end)
	lib.ammailgui.Drag:SetScript("OnMouseUp", function() lib.ammailgui:StopMovingOrSizing() end)
	lib.ammailgui.Drag:SetScript("OnEnter", function() lib.buttonTooltips( lib.ammailgui.Drag, _TRANS('AAMU_HelpTooltip_DragReposition')) end)
	lib.ammailgui.Drag:SetScript("OnLeave", function() GameTooltip:Hide() end)

	-- Text Header
	lib.mguiheader = lib.ammailgui:CreateFontString(one, "OVERLAY", "NumberFontNormalYellow")
	lib.mguiheader:SetText(_TRANS('AAMU_Interface_MailLoaderTitle'))
	lib.mguiheader:SetJustifyH("CENTER")
	lib.mguiheader:SetHeight(14)
	lib.mguiheader:SetPoint("TOPLEFT",  lib.ammailgui, "TOPLEFT", 26, -6)
	lib.mguiheader:SetPoint("TOPRIGHT", lib.ammailgui, "TOPRIGHT", -26, -6)
	lib.ammailgui.mguiheader = lib.mguiheader


	--Hide mail window
	lib.ammailgui.closeButton = CreateFrame("Button", nil, lib.ammailgui, "UIPanelCloseButton")
	lib.ammailgui.closeButton:SetScript("OnClick", function() lib.ammailgui:Hide() end)
	lib.ammailgui.closeButton:SetPoint("TOPRIGHT", lib.ammailgui, "TOPRIGHT", 0,0)

	-- [name of frame]:SetPoint("[relative to point on my frame]","[frame we want to be relative to]","[point on relative frame]",-left/+right, -down/+up)


	lib.mguibtmrules = lib.ammailgui:CreateFontString(two, "OVERLAY", "NumberFontNormalYellow")
	lib.mguibtmrules:SetText(_TRANS('AAMU_Interface_MailRuleLabel'))
	lib.mguibtmrules:SetJustifyH("LEFT")
	lib.mguibtmrules:SetWidth(115)
	lib.mguibtmrules:SetHeight(12)
	lib.mguibtmrules:SetPoint("TOPLEFT",  lib.ammailgui, "TOPLEFT", 12, -20)
	lib.ammailgui.mguibtmrules = lib.mguibtmrules


	lib.mguimailfor = lib.ammailgui:CreateFontString(three, "OVERLAY", "NumberFontNormalYellow")
	lib.mguimailfor:SetText(_TRANS('AAMU_Interface_MailMiscLabel'))
	lib.mguimailfor:SetJustifyH("LEFT")
	lib.mguimailfor:SetWidth(115)
	lib.mguimailfor:SetHeight(12)
	lib.mguimailfor:SetPoint("TOPLEFT",  lib.ammailgui, "TOPLEFT", 126, -20)
	lib.ammailgui.mguimailfor = lib.mguimailfor


	lib.createMailButton(_TRANS('AAMU_Interface_MailBtnDisenchant'), _TRANS('AAMU_HelpTooltip_MailBtnDisenchant'), function() lib.scanBags(lib.disenchantAction) end )
	lib.createMailButton(_TRANS('AAMU_Interface_MailBtnGems'), _TRANS('AAMU_HelpTooltip_MailBtnGems'), function() lib.scanBags(lib.gemAction) end )
	lib.createMailButton(_TRANS('AAMU_Interface_MailBtnHerbs'), _TRANS('AAMU_HelpTooltip_MailBtnHerbs'), function() lib.scanBags(lib.herbAction) end )
	lib.createMailButton(_TRANS('AAMU_Interface_MailBtnProspect'), _TRANS('AAMU_HelpTooltip_MailBtnProspect'), function() lib.scanBags(lib.prospectAction) end )
	lib.createMailButton(_TRANS('AAMU_Interface_MailBtnChantMats'), _TRANS('AAMU_HelpTooltip_MailBtnChantMats'), function() lib.scanBags(lib.dematAction) end )
	lib.createMailButton(_TRANS('AAMU_Interface_MailBtnPigments'), _TRANS('AAMU_HelpTooltip_MailBtnPigments'), function() lib.scanBags(lib.pigmentAction) end )

	--Lets make the Reason code based buttons a  different color Blue for SUI rule based, Green for default lists
	do
		local function buttonrecolor(button, green)
			if UIStyle then
				UIStyle.StyleButton(button, green and "default" or "primary")
				return
			end
			button:SetNormalTexture("Interface\\GLUES\\Common\\Glue-Panel-Button-Up-Blue")
			button:SetPushedTexture("Interface\\GLUES\\Common\\Glue-Panel-Button-Down-Blue")
			button:SetHighlightTexture("Interface\\GLUES\\Common\\Glue-Panel-Button-Highlight-Blue")

			local tex = button:GetNormalTexture()
			tex:SetTexCoord(0,.56,.1,.56)
			if green then
				tex:SetVertexColor(0,1,0,1)
			end
		end

		buttonrecolor(lib.ammailgui.Button1)
		buttonrecolor(lib.ammailgui.Button2, true)
		buttonrecolor(lib.ammailgui.Button3, true)
		buttonrecolor(lib.ammailgui.Button4)
		buttonrecolor(lib.ammailgui.Button5, true)
		buttonrecolor(lib.ammailgui.Button6, true)
	end

--[[Create  CustomMailerFrame]]

	lib.CustomMailerFrame = CreateFrame("Frame", "", UIParent, BackdropTemplateMixin and "BackdropTemplate")
	local frame = lib.CustomMailerFrame
	frame:Hide()

	frame:SetFrameStrata("HIGH")
	if UIStyle then
		UIStyle.StyleWindow(frame, true)
	else
		frame:SetBackdrop({
			bgFile = "Interface/Tooltips/ChatBubble-Background",
			edgeFile = "Interface/Tooltips/ChatBubble-BackDrop",
			tile = true, tileSize = 32, edgeSize = 32,
			insets = { left = 32, right = 32, top = 32, bottom = 32 }
		})
		frame:SetBackdropColor(0,0,0, 1)
	end

	frame:SetPoint("CENTER", UIParent, "CENTER")
	frame:SetWidth(640)
	frame:SetHeight(450)

	frame:SetMovable(true)
	frame:EnableMouse(true)
	frame.Drag = CreateFrame("Button", nil, frame)
	frame.Drag:SetPoint("TOPLEFT", frame, "TOPLEFT", 10,-5)
	frame.Drag:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -10,-5)
	frame.Drag:SetHeight(6)
	frame.Drag:SetHighlightTexture("Interface\\FriendsFrame\\UI-FriendsFrame-HighlightBar")

	frame.Drag:SetScript("OnMouseDown", function() frame:StartMoving() end)
	frame.Drag:SetScript("OnMouseUp", function() frame:StopMovingOrSizing() end)

	frame.DragBottom = CreateFrame("Button",nil, frame)
	frame.DragBottom:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 10,5)
	frame.DragBottom:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -10,5)
	frame.DragBottom:SetHeight(6)
	frame.DragBottom:SetHighlightTexture("Interface\\FriendsFrame\\UI-FriendsFrame-HighlightBar")

	frame.DragBottom:SetScript("OnMouseDown", function() frame:StartMoving() end)
	frame.DragBottom:SetScript("OnMouseUp", function() frame:StopMovingOrSizing() end)


	local title = frame:CreateFontString(aamCustomMailertitle, "OVERLAY", "GameFontNormalLarge")
	title:SetText(_TRANS('AAMU_Interface_CustomMailerTitle'))
	title:SetTextColor(1, 0.85, 0.25)
	title:SetJustifyH("LEFT")
	title:SetWidth(240)
	title:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -16)
	frame.title = title

	--Close Button
	frame.closeButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
	frame.closeButton:SetSize(110, 22)
	frame.closeButton:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 16, 12)
	frame.closeButton:SetText(_TRANS('AAMU_Interface_Close'))
	frame.closeButton:SetScript("OnClick",  function() frame:Hide() end)
	if UIStyle then
		UIStyle.StyleButton(frame.closeButton, "default")
	end

	local SelectBox = LibStub:GetLibrary("SelectBox")
	local ScrollSheet = LibStub:GetLibrary("ScrollSheet")

	function frame.slotclear()
		frame.slot:SetNormalTexture("")
		frame.slot.help:SetText(_TRANS('AAMU_Interface_DropItemBox'))
		frame.slot.workingItem = nil
		frame.addButton:Disable()
		frame.removeButton:Disable()
		lib.MailListUpdate()
	end
	function frame.slotadd(itemID, add)
		if not itemID then frame.slotclear() return end
		local _, itemLink, _, _, _, _, _, _, _, itemTexture = GetItemInfo(itemID)
		frame.slot:SetNormalTexture(itemTexture)
		frame.slot.help:SetText(itemLink)
		frame.slot.workingItem = itemID
		if add then
			frame.addButton:Enable()
			frame.removeButton:Disable()
		else
			frame.addButton:Disable()
			frame.removeButton:Enable()
		end
		lib.MailListUpdate()
	end

	frame.resultlist = CreateFrame("Frame", nil, frame, BackdropTemplateMixin and "BackdropTemplate")
	if UIStyle then
		UIStyle.StylePanel(frame.resultlist)
	else
		frame.resultlist:SetBackdrop({
			bgFile = "Interface/Tooltips/UI-Tooltip-Background",
			edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
			tile = true, tileSize = 32, edgeSize = 16,
			insets = { left = 5, right = 5, top = 5, bottom = 5 }
		})
		frame.resultlist:SetBackdropColor(0, 0, 0.0, 0.5)
	end
	frame.resultlist:SetPoint("TOPLEFT", frame, "TOPLEFT", 260, -38)
	frame.resultlist:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -10, -38)
	frame.resultlist:SetPoint("BOTTOM", frame, "BOTTOM", 0, 12)

	frame.resultlist.sheet = ScrollSheet:Create(frame.resultlist, {
		{ _TRANS('AAMU_Interface_Item'), "TOOLTIP", 170 },
		{ _TRANS('AAMU_Interface_ItemID'), "NUMBER", 170 },
		{"", "TEXT", 0.001 }, --metadata thats not used in visual display
	})
	frame.resultlist.sheet.enableselect = true

	--After we have finished creating the scrollsheet and all saved settings have been applied set our event processor
	function frame.resultlist.sheet.Processor(callback, self, button, column, row, order, curDir, ...)
		if (callback == "OnEnterCell")  then
		--	lib.ASCOnEnter(button, row, column)
		elseif (callback == "OnLeaveCell") then
			GameTooltip:Hide()
		elseif (callback == "OnClickCell") then
			local itemID = frame.resultlist.sheet:GetSelection()[2]
			frame.slotadd(itemID)
		elseif (callback == "OnMouseDownCell") then
		--	lib.ASCSelect()
		end
	end
	--use our custom sort method not scrollsheets
	frame.resultlist.sheet.CustomSort = lib.CustomSort

	--parse saved buttons into the scrollframe format for display
	function lib.MailListUpdate()
		local settings = frame.buttonList.SavedButtons
		local selection = frame.buttonList.sheet:GetSelection()[1]
		--parse
		local B, D = {},{}
		for button, dataTable in pairs(settings) do
			table.insert(B, {button})
			if selection == button then
				D = dataTable
			end
		end
		if selection then
			frame.workingname:SetText(_TRANS('AAMU_Interface_ItemsMailedBy').." |Cffff0000"..selection:upper())
			frame.removeListButton:Enable()
		else
			frame.workingname:SetText(_TRANS('AAMU_Interface_SelectButtonLeft'))
			frame.removeListButton:Disable()
		end
		--update and render scrollframes
		frame.buttonList.sheet:SetData(B)
		frame.resultlist.sheet:SetData(D)

		frame.buttonList.sheet:Render()
		frame.resultlist.sheet:Render()
	end
	--Edit box for changing/creating lists
	frame.listEditBox = CreateFrame("EditBox", "", frame, "InputBoxTemplate")
	frame.listEditBox:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
	frame.listEditBox:SetAutoFocus(true)
	frame.listEditBox:Hide()
	frame.listEditBox:SetHeight(15)
	frame.listEditBox:SetFrameStrata("DIALOG")
	frame.listEditBox:SetWidth(30)
	frame.listEditBox:SetScript("OnEscapePressed", function(self) self:Hide() end)
	frame.listEditBox:SetScript("OnEnterPressed", function(self)
						local sheet = frame.buttonList.sheet
						local Old = frame.listEditBox.OrigText
						local text = self:GetText()
						local settings = frame.buttonList.SavedButtons

						if not settings[text] then
							--if new line or hidden we will have a nil. So add a new entry to the data
							if Old == nil then
								settings[text] = {}
								lib.createMailButton(text, _TRANS('AAMU_HelpTooltip_CustomMailBtn'), lib.customAction)
							else
								for i, name in pairs(sheet.data) do
									if name == Old then
										sheet.data[i] = self:GetText()
										settings[text] = settings[Old]
										settings[Old] = nil
										break
									end
								end
							end
						else
							print(_TRANS('AAMU_Interface_ButtonExists'):format(text))
						end
						lib.MailListUpdate()
						frame.listEditBox:Hide()
					end)


	--Frame for displaying the lists
	frame.buttonList = CreateFrame("Frame", nil, frame, BackdropTemplateMixin and "BackdropTemplate")
	if UIStyle then
		UIStyle.StylePanel(frame.buttonList)
	else
		frame.buttonList:SetBackdrop({
			bgFile = "Interface/Tooltips/UI-Tooltip-Background",
			edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
			tile = true, tileSize = 32, edgeSize = 16,
			insets = { left = 5, right = 5, top = 5, bottom = 5 }
		})
		frame.buttonList:SetBackdropColor(0, 0, 0.0, 0.5)
	end
	frame.buttonList:SetWidth(140)
	frame.buttonList:SetHeight(235)
	frame.buttonList:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 16, 44)

	frame.buttonList.sheet = ScrollSheet:Create(frame.buttonList, {
--~ 		{ ('Add'), "TEXT", 30 },
		{ _TRANS('AAMU_Interface_ButtonName'), "TOOLTIP", 100 },
		{"", "TEXT", 0.001 }, --metadata thats not used in visual display
	})
	frame.buttonList.sheet.enableselect = true

	frame.listEditBox:SetParent(frame.buttonList.sheet.content)

	frame.buttonList.SavedButtons = get("util.automagic.SavedMailButtons")
	if not frame.buttonList.SavedButtons then
		frame.buttonList.SavedButtons = {}
		SavedButtons = set("util.automagic.SavedMailButtons", frame.buttonList.SavedButtons)
	end

	--After we have finished creating the scrollsheet and all saved settings have been applied set our event processor
	function frame.buttonList.sheet.Processor(callback, self, button, column, row, order, curDir, ...)
		if (callback == "OnEnterCell")  then
		--	lib.ASCOnEnter(button, row, column)
		elseif (callback == "OnLeaveCell") then
			GameTooltip:Hide()
		elseif (callback == "OnClickCell") then
			local clickedFrame = self.rows[row][column]
			local text = clickedFrame:GetText()

			lib.MailListUpdate()
			if not clickedFrame:IsVisible() then text = nil end --Old data is still in the frames, just hidden

			if IsShiftKeyDown() then
				frame.listEditBox:ClearAllPoints()
				frame.listEditBox:SetAllPoints(clickedFrame)
				frame.listEditBox:ClearFocus() --clear focus then set so we highlight current text
				frame.listEditBox:Show()
				frame.listEditBox:SetFocus()
				frame.listEditBox.OrigText = text

				if not text then text = "" end
				frame.listEditBox:SetText(text)
			end
		elseif (callback == "OnMouseDownCell") then

		end
	end

	frame.buttonList.help = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	frame.buttonList.help:ClearAllPoints()
	frame.buttonList.help:SetPoint("TOPLEFT", frame.buttonList, "TOPRIGHT", 8, 0)
	frame.buttonList.help:SetJustifyH("LEFT")
	frame.buttonList.help:SetText(_TRANS('AAMU_Interface_CustomMailerHelp'))
	frame.buttonList.help:SetWidth(90)


	--Itemicon/slot
	frame.slot = CreateFrame("Button", "autoMagicSlotFrame", frame, "UIPanelButtonTemplate")
	frame.slot:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -48)
	frame.slot:SetSize(42, 42)
	frame.slot:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square.blp")
		function frame.slotIconDrop(self, data, ...)
			local objtype, itemID = GetCursorInfo()
			ClearCursor()
			if objtype == "item" then
				frame.slotadd(itemID, true)
			else
				frame.slotclear()
			end
		end
	frame.slot:SetScript("OnClick", frame.slotIconDrop)
	frame.slot:SetScript("OnReceiveDrag", frame.slotIconDrop)

	frame.slot.help = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	frame.slot.help:SetPoint("LEFT", frame.slot, "RIGHT", 10, 0)
	frame.slot.help:SetJustifyH("LEFT")
	frame.slot.help:SetText(_TRANS('AAMU_Interface_DropItemBox'))
	frame.slot.help:SetWidth(180)

	frame.workingname = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	frame.workingname:SetPoint("BOTTOMLEFT", frame.resultlist, "TOPLEFT", 0, 6)
	frame.workingname:SetJustifyH("LEFT")
	frame.workingname:SetText("|Cff00ffff")
	frame.workingname:SetWidth(350)


	frame.removeListButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
	frame.removeListButton:SetPoint("BOTTOMLEFT", frame.buttonList, "TOPLEFT", 0, 6)
	frame.removeListButton:SetSize(160, 22)
	frame.removeListButton:SetText(_TRANS('AAMU_Interface_RemoveSelectedList'))
	frame.removeListButton:Disable()
	frame.removeListButton:SetScript("OnClick",  function()
					local settings = frame.buttonList.SavedButtons
					local buttonName = frame.buttonList.sheet:GetSelection()[1]
					if settings and buttonName then
						settings[buttonName] = nil
					end
					lib.MailListUpdate()
				end)

	frame.addButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
	frame.addButton:SetSize(95, 22)
	frame.addButton:SetPoint("TOPLEFT", frame.slot, "BOTTOMLEFT", 0, -10)
	frame.addButton:SetText(_TRANS('AAMU_Interface_Add'))
	frame.addButton:Disable()
	frame.addButton:SetScript("OnClick",  function()
					local itemID = frame.slot.workingItem
					local settings = frame.buttonList.SavedButtons
					local selection = frame.buttonList.sheet:GetSelection()[1]
					if itemID and settings and selection then
						local _, itemLink = GetItemInfo(itemID)
						local exists
						for i, data in pairs(settings[selection]) do
							if data[2] == itemID then
								exists = true
								break
							end
						end
						if not exists then
							table.insert(settings[selection], {itemLink, itemID})
						else
							print(itemLink, _TRANS('AAMU_Interface_AlreadyOnList'))
						end
					end
					frame.slotclear()
				end)
	frame.addButton:SetScript("OnEnter", function() lib.buttonTooltips( frame.addButton, _TRANS('AAMU_HelpTooltip_AddItemToList')) end)
	frame.addButton:SetScript("OnLeave", function() GameTooltip:Hide() end)


	frame.removeButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
	frame.removeButton:SetSize(95, 22)
	frame.removeButton:SetPoint("LEFT", frame.addButton, "RIGHT", 8, 0)
	frame.removeButton:SetText(_TRANS('AAMU_Interface_Remove'))
	frame.removeButton:Disable()
	frame.removeButton:SetScript("OnClick", function(self)
		local settings = frame.buttonList.SavedButtons
		local buttonName = frame.buttonList.sheet:GetSelection()[1]
		local selection = frame.resultlist.sheet:GetSelection()[1]

		--parse
		for button, dataTable in pairs(settings) do
			for i, data in pairs(dataTable) do
				if selection == data[1] then
					print(data[1])
					table.remove(dataTable, i)
					break
				end

			end
		end
		frame.slotclear()
	end)

	--create buttons
	for buttonName in pairs(frame.buttonList.SavedButtons) do
		lib.createMailButton(buttonName, _TRANS('AAMU_HelpTooltip_CustomMailBtn'), lib.customAction)
	end
	if UIStyle then
		UIStyle.StyleItemSlot(frame.slot, 42)
		UIStyle.StyleEditBox(frame.listEditBox)
		UIStyle.StyleButton(frame.removeListButton, "default")
		UIStyle.StyleButton(frame.addButton, "primary")
		UIStyle.StyleButton(frame.removeButton, "default")
	end


	--Add Config button to mail window
	lib.ammailgui.configureButton = CreateFrame("Button", nil, lib.ammailgui)
	lib.ammailgui.configureButton:SetPoint("TOPLEFT", lib.ammailgui, "TOPLEFT", 6, -4)
	lib.ammailgui.configureButton:SetHeight(20)
	lib.ammailgui.configureButton:SetWidth(20)
	lib.ammailgui.configureButton:SetNormalTexture("Interface\\GossipFrame\\HealerGossipIcon")
	lib.ammailgui.configureButton:SetHighlightTexture("Interface\\GossipFrame\\BinderGossipIcon")


	lib.ammailgui.configureButton:SetScript("OnClick", function()
											if frame:IsVisible() then
												frame:Hide()
											else
												frame:Show()
											end
										end)
	lib.ammailgui.configureButton:SetScript("OnEnter", function(self)
								GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
								GameTooltip:SetText(_TRANS('AAMU_HelpTooltip_ClickAddMailButtons'))
							end)
	lib.ammailgui.configureButton:SetScript("OnLeave", function() GameTooltip:Hide() end)


	lib.MailListUpdate()

end


lib.ammailgui.ButtonCount = 1
lib.ammailgui.ButtonRow = 1
lib.ammailgui.ButtonTotal = 1
function lib.createMailButton(name, tooltip, click)
	--if we have finished a row start a new one
	if lib.ammailgui.ButtonCount > 3 then
		lib.ammailgui.ButtonRow = lib.ammailgui.ButtonRow + 1
		lib.ammailgui.ButtonCount = 1
	end
	local total = lib.ammailgui.ButtonTotal
	local buttonRef = "Button"..total

	lib.ammailgui[buttonRef]= CreateFrame("Button", "", lib.ammailgui, "UIPanelButtonTemplate")
	lib.ammailgui[buttonRef]:SetSize(108, 22)
	lib.ammailgui[buttonRef]:SetText(name)
	lib.ammailgui[buttonRef]:SetScript("OnEnter", function() lib.buttonTooltips( lib.ammailgui[buttonRef], tooltip) end)
	lib.ammailgui[buttonRef]:SetScript("OnLeave", function() GameTooltip:Hide() end)
	lib.ammailgui[buttonRef]:SetScript("OnClick", click)
	local Configator = LibStub and LibStub("Configator", true)
	if Configator and Configator.UIStyle then
		Configator.UIStyle.StyleButton(lib.ammailgui[buttonRef], "default")
	end


	if lib.ammailgui.ButtonCount == 1 then --anchor to starting point
		local yOffset = -34 - (lib.ammailgui.ButtonRow - 1) * 25
		lib.ammailgui[buttonRef]:SetPoint("TOPLEFT", lib.ammailgui, "TOPLEFT", 10, yOffset)
	else
		local prevButton = "Button"..(total - 1)
		lib.ammailgui[buttonRef]:SetPoint("LEFT", lib.ammailgui[prevButton], "RIGHT", 8, 0)
	end

	--set frame height for player added buttons
	if lib.ammailgui.ButtonRow > 2 then
		local extraH = 25 * (lib.ammailgui.ButtonRow - 2)
		lib.ammailgui:SetHeight(88 + extraH)
	end

	lib.ammailgui.ButtonTotal = lib.ammailgui.ButtonTotal + 1
	lib.ammailgui.ButtonCount = lib.ammailgui.ButtonCount + 1
end




AucAdvanced.RegisterRevision("$URL: Auc-Advanced/Modules/Auc-Util-AutoMagic/Mail-GUI.lua $", "$Rev: 6755 $")
