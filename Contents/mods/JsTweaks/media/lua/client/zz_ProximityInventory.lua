if not getActivatedMods():contains("ProximityInventory") then return end
print("Patching ProximityInventory")

ProxInv.getTooltip = function()
    if ProxInv.isToggled then
        return getText("IGUI_ProxInv_Tooltip_ToggleOn")
    else
        return getText("IGUI_ProxInv_Tooltip_ToggleOff")
    end
end

local textToggleOn = getText("IGUI_ProxInv_Context_ToggleOn")
local textToggleOff = getText("IGUI_ProxInv_Context_ToggleOff")
local textForceSelectOn = getText("IGUI_ProxInv_Context_ForceSelectOn")
local textForceSelectOff = getText("IGUI_ProxInv_Context_ForceSelectOff")
local textHighlightOn = getText("IGUI_ProxInv_Context_HighlightOn")
local textHighlightOff = getText("IGUI_ProxInv_Context_HighlightOff")
local iconToggleOn = ProxInv.inventoryIcon
local iconToggleOff = nil
local iconForceSelectOn = getTexture("media/ui/Panel_Icon_Pin.png")
local iconForceSelectOff = nil
local iconHighlightOn = getTexture("media/textures/Item_LightBulb.png")
local iconHighlightOff = nil
ProxInv.populateContextMenuOptions = function(context)
    local textToggle = ProxInv.isToggled and textToggleOn or textToggleOff
    local optToggle = context:addOption(textToggle, nil, ProxInv.toggleState)
    optToggle.iconTexture = ProxInv.isToggled and iconToggleOn or iconToggleOff;

    local textForceSelect = ProxInv.isForceSelected and textForceSelectOn or textForceSelectOff
    local optForce = context:addOption(textForceSelect, nil, ProxInv.setForceSelected)
    optForce.iconTexture = ProxInv.isForceSelected and iconForceSelectOn or iconForceSelectOff;

    local textHighlight = ProxInv.isHighlightEnable and textHighlightOn or textHighlightOff
    local optHighlight = context:addOption(textHighlight, nil, ProxInv.setHighlightEnable)
    optHighlight.iconTexture = ProxInv.isHighlightEnable and iconHighlightOn or iconHighlightOff;
end

local ISInventoryPage_addContainerButton = ISInventoryPage.addContainerButton
function ISInventoryPage:addContainerButton(container, texture, name, tooltip)
    if texture == ProxInv.inventoryIcon and name == "Proximity Inv" then
        name = getText("IGUI_ProxInv_InventoryName")
    end
    return ISInventoryPage_addContainerButton(self, container, texture, name, tooltip)
end
