local T, C, L, G = unpack(select(2, ...))
local dragFrameList = G.dragFrameList

local padding = 10
local buttonssize = aCoreCDB["ActionbarOptions"]["extrabarbuttonsize"]

-- FUNCTIONS

local num = 1
local buttonList = {}

--create the frame to hold the buttons
local frame = CreateFrame("Frame", "Altz_extrabarbutton", UIParent, "SecureHandlerStateTemplate")
frame.movingname = L["额外特殊按钮"]
frame.point = {
		healer = {a1 = "BOTTOMLEFT", parent = "UIParent", a2 = "BOTTOM", x = 320, y = 20},
		dpser = {a1 = "BOTTOMLEFT", parent = "UIParent", a2 = "BOTTOM", x = 320, y = 20},
	}
T.CreateDragFrame(frame) --frame, dragFrameList, inset, clamp
frame:SetWidth(num*buttonssize + 2*padding)
frame:SetHeight(buttonssize + 2*padding)

--move the buttons into position and reparent them
ExtraActionBarFrame:SetParent(frame)
ExtraActionBarFrame:EnableMouse(false)
ExtraActionBarFrame:ClearAllPoints()
ExtraActionBarFrame:SetPoint("CENTER", 0, 0)
ExtraActionBarFrame.ignoreFramePositionManager = true

--the extra button
local button = ExtraActionButton1
table.insert(buttonList, button) --add the button object to the list
button:SetSize(buttonssize,buttonssize)

--hide the frame when in a vehicle!
RegisterStateDriver(frame, "visibility", "[petbattle][overridebar][vehicleui] hide; show")

local frame2 = CreateFrame("Frame", "Altz_DraenorZoneAbilitybutton", UIParent, "SecureHandlerStateTemplate")
frame2.movingname = L["额外特殊按钮"].."2"
frame2.point = {
		healer = {a1 = "BOTTOMLEFT", parent = "UIParent", a2 = "BOTTOM", x = 370, y = 20},
		dpser = {a1 = "BOTTOMLEFT", parent = "UIParent", a2 = "BOTTOM", x = 370, y = 20},
	}
T.CreateDragFrame(frame2) --frame, dragFrameList, inset, clamp
frame2:SetWidth(num*buttonssize + 2*padding)
frame2:SetHeight(buttonssize + 2*padding)

DraenorZoneAbilityFrame:SetParent(frame2)
DraenorZoneAbilityFrame:EnableMouse(false)
DraenorZoneAbilityFrame:ClearAllPoints()
DraenorZoneAbilityFrame:SetPoint("CENTER", 0, 0)
DraenorZoneAbilityFrame.ignoreFramePositionManager = true

--the extra button
local button2 = DraenorZoneAbilityFrame.SpellButton
table.insert(buttonList, button2) --add the button object to the list
button2:SetSize(buttonssize,buttonssize)

--hide the frame when in a vehicle!
RegisterStateDriver(frame2, "visibility", "[petbattle][overridebar][vehicleui] hide; show")
