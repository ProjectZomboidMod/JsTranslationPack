if not getActivatedMods():contains("AutoDrop") then return end
print("Patching AutoLoot")

local function openConfig()
    --#region from function AutoDrop.KeyPressed(keynum)
    --if solo [not isClient() and not isServer()] and in game[getPlayer()]
    if not isClient() and not isServer() and getPlayer() then
        setGameSpeed(0); getGameTime():setMultiplier(1); --freeze game
    end
    --load config
    AutoDropChangeConf();
    AutoDrop.SetInventoriesNeedPlunder();
    --#endregion
end

local ISInventoryPage_createChildren = ISInventoryPage.createChildren
function ISInventoryPage:createChildren()
    ISInventoryPage_createChildren(self)
    if self.onCharacter and self.swapAutoLoot then
        self.swapAutoLoot.onRightMouseDown = openConfig
    end
end
