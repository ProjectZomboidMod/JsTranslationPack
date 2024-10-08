if not getActivatedMods():contains("pzhotbar") then return end
print("Patching pzhotbar")

local ISBzHotSlot = require("pzhotbar/ISUI/ISBzHotSlot").ISBzHotSlot

local ISBzHotSlot_onRightMouseUp = ISBzHotSlot.onRightMouseUp
ISBzHotSlot.onRightMouseUp = function(self, x, y)
    if isAltKeyDown() then
        self:removeItem()
    elseif self.itemInfo.itemFullName then
        ISBzHotSlot_onRightMouseUp(self, x, y)
    end
end
