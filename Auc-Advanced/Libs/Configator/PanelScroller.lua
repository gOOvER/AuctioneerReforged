--[[
	PanelScroller
	Version: 2.5.6736 (SwimmingSeadragon)
	Revision: $Id: PanelScroller.lua 6736 2022-01-25 11:42:44Z none $
	URL: 

	License:
		This library is free software; you can redistribute it and/or
		modify it under the terms of the GNU Lesser General Public
		License as published by the Free Software Foundation; either
		version 2.1 of the License, or (at your option) any later version.

		This library is distributed in the hope that it will be useful,
		but WITHOUT ANY WARRANTY; without even the implied warranty of
		MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
		Lesser General Public License for more details.

		You should have received a copy of the GNU Lesser General Public
		License along with this library; if not, write to the Free Software
		Foundation, Inc., 51 Franklin Street, Fifth Floor,
		Boston, MA  02110-1301  USA

	Additional:
		Regardless of any other conditions, you may freely use this code
		within the World of Warcraft game client.
--]]

local LIBRARY_VERSION_MAJOR = "PanelScroller"
local LIBRARY_VERSION_MINOR = 7
local lib = LibStub:NewLibrary(LIBRARY_VERSION_MAJOR, LIBRARY_VERSION_MINOR)
if not lib then return end

local kit = {
	hPos = 0, hSize = 0, hWin = 0, hType = "AUTO",
	vPos = 0, vSize = 0, vWin = 0, vType = "AUTO",
}
local abs = abs

-- Set whether to allow horizontal scrolling ("YES", "NO" or "AUTO")
function kit:SetScrollBarVisible(axis, visibility)
	if not (visibility == "YES"
		or visibility == "NO"
		or visibility == "AUTO"
		or visibility == "FAUX"
	) then
		return error("Invalid visibility, must be one of YES, NO or AUTO")
	end
	if axis == "HORIZONTAL" then
		self.hType = visibility
	elseif axis == "VERTICAL" then
		self.vType = visibility
	else
		return error("Invalid axis type, must be one of HORIZONTAL or VERTICAL")
	end

	self:Update()
end

function kit:MouseScroll(direction)
	if self.vType == "NO" then
		if self.hType == "FAUX" then
			self:ScrollByPixels("HORIZONTAL", -1 * direction)
		elseif self.hType ~= "NO" then
			self:ScrollByPercent("HORIZONTAL", -0.1 * direction)
		end
	elseif self.vType == "FAUX" then
		self:ScrollByPixels("VERTICAL", -1 * direction)
	else
		self:ScrollByPercent("VERTICAL", -0.1 * direction)
	end
end

-- Performs a scroll along the specified axis by a given percentage of the window size
--This % will always be 1 page of datain the vertical direction
function kit:ScrollByPercent(axis, percent)
	local scrollbar, curpos, winsize, scrollrange
	if axis == "HORIZONTAL" then
		scrollbar = self.hScroll
		scrollrange = self.hSize
		winsize = self.hWin
		curpos = self.hPos
		--horizontal will be % of  total size
		percent = (winsize*percent)
	elseif axis == "VERTICAL" then
		scrollbar = self.vScroll
		scrollrange = self.vSize
		winsize = self.vWin
		curpos = self.vPos
		--vertical is 1 page of data varies by # of  data rows in that scrollframe or (winsize*percent)
		if self:GetParent().sheet and self:GetParent().sheet.rows then
			if percent > 0 then
				percent = #self:GetParent().sheet.rows
			else
				percent = -#self:GetParent().sheet.rows
			end
		else
			percent = (winsize*percent)
		end
	else
		return error("Unknown axis for scrolling, must be one of HORIZONTAL or VERTICAL")
	end
	local dest = math.max(0, math.min(curpos + (percent), scrollrange))
	if (abs(dest - curpos) > 0.01) then
		scrollbar:SetValue(dest)
	end
	self:ScrollSync()
end

-- Performs a scroll along the specified axis by a given number of pixels
function kit:ScrollByPixels(axis, pixels)
	local scrollbar, curpos, scrollrange
	if axis == "HORIZONTAL" then
		scrollbar = self.hScroll
		scrollrange = self.hSize
		curpos = self.hPos
	elseif axis == "VERTICAL" then
		scrollbar = self.vScroll
		scrollrange = self.vSize
		curpos = self.vPos
	else
		return error("Unknown axis for scrolling, must be one of HORIZONTAL or VERTICAL")
	end
	local dest = math.max(0, math.min(curpos + pixels, scrollrange))
	if (abs(dest - curpos) > 0.01) then
		scrollbar:SetValue(dest)
	end
	self:ScrollSync()
end

function kit:ScrollToCoords(x, y)
	if x then
		local dest = math.max(0, math.min(x, self.hSize))
		if (abs(dest - x) > 0.01) then
			self.hScroll:SetValue(dest)
		end
	end
	if y then
		local dest = math.max(0, math.min(y, self.vSize))
		if (abs(dest - y) > 0.01) then
			self.vScroll:SetValue(dest)
		end
	end
	self:ScrollSync()
end

function kit:ScrollSync()
	if (self.hType ~= "FAUX") then
		self:SetHorizontalScroll(self.hScroll:GetValue()) --removed the * -1  inversion. Scrolling >right> now uses a positive integer as of wow patch 3.3.3
	end
	if (self.vType ~= "FAUX") then
		self:SetVerticalScroll(self.vScroll:GetValue())
	end
	self:Update()
end

-- This function updates the entire scrollable unit, hidin
function kit:Update()
	if not self:IsVisible() then
		self.hScroll:Hide()
		self.vScroll:Hide()
		return
	end
	if self.UpdateScrollChildRect then
		self:UpdateScrollChildRect()
	end

	local child = self:GetScrollChild()
	local winW = self:GetWidth() or 0
	local winH = self:GetHeight() or 0

	if self.hType ~= "FAUX" then
		self.hSize = self:GetHorizontalScrollRange() or 0
		if child and winW > 0 then
			local manualH = math.max(0, (child:GetWidth() or 0) - winW)
			if manualH > self.hSize then
				self.hSize = manualH
			end
		end
	end
	if self.vType ~= "FAUX" then
		self.vSize = self:GetVerticalScrollRange() or 0
		if child and winH > 0 then
			local manualV = math.max(0, (child:GetHeight() or 0) - winH)
			if manualV > self.vSize then
				self.vSize = manualV
			end
		end
	end

	self.hPos = self.hScroll:GetValue()
	self.vPos = self.vScroll:GetValue()

	self.hWin = winW
	self.vWin = winH

	if (self.hPos > self.hSize) then self.hPos = self.hSize end
	if (self.vPos > self.vSize) then self.vPos = self.vSize end

	local hMin, hMax = self.hScroll:GetMinMaxValues()
	local vMin, vMax = self.vScroll:GetMinMaxValues()
	if abs(hMin) > 0.01 or abs(vMin) > 0.01 or
	abs(hMax-self.hSize) > 0.01 or
	abs(vMax-self.vSize) > 0.01 then
		self.hScroll:SetMinMaxValues(0, self.hSize)
		self.vScroll:SetMinMaxValues(0, self.vSize)

		self.hScroll:SetValue(self.hPos)
		self.vScroll:SetValue(self.vPos)
	end

	if self.hType == "NO" then
		self.hScroll:Hide()
	elseif self.hType == "FAUX" then
		self.hScroll:Show()
		self.hScroll.incrButton:Enable()
		self.hScroll.decrButton:Enable()
	elseif math.floor(self.hSize-30) <= 0 then
		if self.hType == "YES" then
			self.hScroll:Show()
			self.hScroll.incrButton:Disable()
			self.hScroll.decrButton:Disable()
		else
			self.hScroll:Hide()
		end
	else
		self.hScroll:Show()
		self.hScroll.incrButton:Enable()
		self.hScroll.decrButton:Enable()
	end

	if self.vType == "NO" then
		self.vScroll:Hide()
	elseif self.vType == "FAUX" then
		self.vScroll:Show()
		self.vScroll.incrButton:Enable()
		self.vScroll.decrButton:Enable()
	elseif math.floor(self.vSize) <= 0 then
		if self.vType == "YES" then
			self.vScroll:Show()
			self.vScroll.incrButton:Disable()
			self.vScroll.decrButton:Disable()
		else
			self.vScroll:Hide()
		end
	else
		self.vScroll:Show()
		self.vScroll.incrButton:Enable()
		self.vScroll.decrButton:Enable()
	end

	if self.callback then
		self.callback()
	end
end

function lib:Create(name, parent)
	local scroller = lib:CreateTemplate(name, parent)
	scroller.hScroll = _G[name.."HorizontalScrollBar"];
	scroller.vScroll = _G[name.."VerticalScrollBar"];
	for k,v in pairs(kit) do
		scroller[k] = v
	end
	return scroller
end

-- Conversion of XML templates to Lua equivalent, requiring some structuring modifications
-- todo: Consider merging this into lib:Create
-- todo: Consider removing names from sub-frames and artwork - they take up space in Global - could be attached as key/value instead
-- todo: Option to only create Vertical or Horizontal scrllbars, where we know the other bar will never be used

-- OnScript functions
local function LeftButtonOnClick(self)
	local bar = self:GetParent()
	local scroller = (bar and bar.scroller) or bar:GetParent()
	scroller:ScrollByPercent("HORIZONTAL", -0.25)
	PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
end

local function RightButtonOnClick(self)
	local bar = self:GetParent()
	local scroller = (bar and bar.scroller) or bar:GetParent()
	scroller:ScrollByPercent("HORIZONTAL", 0.25)
	PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
end

local function UpButtonOnClick(self)
	local bar = self:GetParent()
	local scroller = (bar and bar.scroller) or bar:GetParent()
	scroller:ScrollByPercent("VERTICAL", -0.25)
	PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
end

local function DownDuttonOnClick(self)
	local bar = self:GetParent()
	local scroller = (bar and bar.scroller) or bar:GetParent()
	scroller:ScrollByPercent("VERTICAL", 0.25)
	PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
end

local function HorizontalScrollBarOnValueChanged(self, value)
	local scroller = self.scroller or self:GetParent()
	scroller:ScrollToCoords(value, nil)
end

local function VerticalScrollBarOnValueChanged(self, value)
	local scroller = self.scroller or self:GetParent()
	scroller:ScrollToCoords(nil, value)
end

local function ScrollUpdate(self)
	self:Update()
end

local function OnMouseWheel(self, delta)
	self:MouseScroll(delta)
end

-- Widget template creation functions

local function ButtonTemplate(name, parent, normalPath, pushedPath, disabledPath, highlightPath)
	local button = CreateFrame("Button", name, parent)
	button:SetWidth(16)
	button:SetHeight(16)

	button:SetNormalTexture(normalPath)
	button:GetNormalTexture():SetTexCoord(.25, .75, .25, .75)

	button:SetPushedTexture(pushedPath)
	button:GetPushedTexture():SetTexCoord(.25, .75, .25, .75)

	if disabledPath then
		button:SetDisabledTexture(disabledPath)
		button:GetDisabledTexture():SetTexCoord(.25, .75, .25, .75)
	end

	button:SetHighlightTexture(highlightPath, "ADD")
	button:GetHighlightTexture():SetTexCoord(.25, .75, .25, .75)

	return button
end

local function KnobTemplate(name, parent)
	local knobTex = parent:CreateTexture(name)
	knobTex:SetTexture("Interface\\Buttons\\UI-ScrollBar-Knob")
	knobTex:SetTexCoord(.25, .75, .25, .75)
	knobTex:SetHeight(16)
	knobTex:SetWidth(16)

	return knobTex
end

local function HorizontalScrollBarTemplate(name, parent)
	local scrollbar = CreateFrame("Slider", name , parent)
	scrollbar:SetOrientation("HORIZONTAL")
	scrollbar:SetWidth(0)
	scrollbar:SetHeight(16)

	local leftButton = ButtonTemplate(name.."ScrollLeftButton", scrollbar,
		"Interface\\Glues\\Common\\Glue-LeftArrow-Button-Up",
		"Interface\\Glues\\Common\\Glue-LeftArrow-Button-Down",
		nil,
		"Interface\\Glues\\Common\\Glue-LeftArrow-Button-Highlight"
	)
	leftButton:SetPoint("RIGHT", scrollbar, "LEFT")
	leftButton:SetScript("OnClick", LeftButtonOnClick)
	scrollbar.decrButton = leftButton

	local rightButton = ButtonTemplate(name.."ScrollRightButton", scrollbar,
		"Interface\\Glues\\Common\\Glue-RightArrow-Button-Up",
		"Interface\\Glues\\Common\\Glue-RightArrow-Button-Down",
		nil,
		"Interface\\Glues\\Common\\Glue-RightArrow-Button-Highlight"
	)
	rightButton:SetPoint("LEFT", scrollbar, "RIGHT")
	rightButton:SetScript("OnClick", RightButtonOnClick)
	scrollbar.incrButton = rightButton

	scrollbar:SetThumbTexture(KnobTemplate(name.."ThumbTexture", scrollbar))
	scrollbar:SetScript("OnValueChanged", HorizontalScrollBarOnValueChanged)
	return scrollbar
end

local function VerticalScrollBarTemplate(name, parent)
	local scrollbar = CreateFrame("Slider", name , parent)
	scrollbar:SetOrientation("VERTICAL")
	scrollbar:SetWidth(16)
	scrollbar:SetHeight(0)

	local upButton = ButtonTemplate(name.."ScrollUpButton", scrollbar,
		"Interface\\Buttons\\UI-ScrollBar-ScrollUpButton-Up",
		"Interface\\Buttons\\UI-ScrollBar-ScrollUpButton-Down",
		"Interface\\Buttons\\UI-ScrollBar-ScrollUpButton-Disabled",
		"Interface\\Buttons\\UI-ScrollBar-ScrollUpButton-Highlight"
	)
	upButton:SetPoint("BOTTOM", scrollbar, "TOP")
	upButton:SetScript("OnClick", UpButtonOnClick)
	scrollbar.incrButton = upButton

	local downButton = ButtonTemplate(name.."ScrollDownButton", scrollbar,
		"Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Up",
		"Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Down",
		"Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Disabled",
		"Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Highlight"
	)
	downButton:SetPoint("TOP", scrollbar, "BOTTOM")
	downButton:SetScript("OnClick", DownDuttonOnClick)
	scrollbar.decrButton = downButton

	scrollbar:SetThumbTexture(KnobTemplate(name.."ThumbTexture", scrollbar))
	scrollbar:SetScript("OnValueChanged", VerticalScrollBarOnValueChanged)
	return scrollbar
end

function lib:CreateTemplate(name, parent)
	local frame = CreateFrame("ScrollFrame", name, parent)
	if frame.SetClipsChildren then
		frame:SetClipsChildren(true)
	end

	local barParent = parent or frame
	local hbar = HorizontalScrollBarTemplate(name.."HorizontalScrollBar", barParent)
	hbar.scroller = frame
	hbar:SetPoint("TOPLEFT", frame, "BOTTOMLEFT", 16, -1)
	hbar:SetPoint("TOPRIGHT", frame, "BOTTOMRIGHT", -16, -1)

	local vbar = VerticalScrollBarTemplate(name.."VerticalScrollBar", barParent)
	vbar.scroller = frame
	vbar:SetPoint("TOPLEFT", frame, "TOPRIGHT", 1, -16)
	vbar:SetPoint("BOTTOMLEFT", frame, "BOTTOMRIGHT", 1, 16)

	frame:SetScript("OnScrollRangeChanged", ScrollUpdate)
	frame:SetScript("OnVerticalScroll", ScrollUpdate)
	frame:SetScript("OnHorizontalScroll", ScrollUpdate)
	frame:SetScript("OnMouseWheel", OnMouseWheel)
	frame:SetScript("OnShow", ScrollUpdate)
	frame:SetScript("OnHide", function()
		hbar:Hide()
		vbar:Hide()
	end)

	return frame
end
