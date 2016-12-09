-- OnInit

aura_env.healspec = { 
    [105] = true, -- Restoration Druid
    [270] = true, -- Mistweaver Monk
    [65] = true,  -- Holy Paladin
    [256] = true, -- Discipline Priest
    [257] = true, -- Holy Priest
    [264] = true  -- Restoration Shman
}

aura_env.damagespec = {
    [251] = true, -- Frost Death Knight
    [252] = true, -- Unholy Death Knight
    [577] = true, -- Havoc Demon Hunter
    [102] = true, -- Balance Druid
    [103] = true, -- Feral Druid
    [269] = true, -- Windwalker Monk
    [70] = true,  -- Retribution Paladin
    [258] = true, -- Shadow Priest
    [262] = true, -- Elemental Shaman
    [263] = true, -- Enhancement Shaman
    [71]  = true, -- Arms Warrior
    [72]  = true -- Fury Warrior
}

aura_env.tankspec = {
    [250] = true, -- Blood Death Knight
    [581] = true, -- Vengeance Demon Hunter
    [104] = true, -- Guardian Druid
    [268] = true, -- Brewmaster Monk
    [66] = true,  -- Protection Paladin
    [73]  = true  -- Protection Warrior
}

--- Display Text

fucntion()
local PlayerRole = UnitGroupRolesAssigned("player")
local specValue = GetSpecialization()
local specID = GetSpecializationInfo(specValue)

    if aura_env.healspec[specID] and PlayerRole == "HEALER" then
        return "SWAP TO HEALING SPEC!" and \\Inteface\LFGFRAME\UI-LFG-ICON-ROLES-HEALING.blp -- icon path
    elseif aura_env.tankspec[specID] and PlayerRole == "TANK" then
        return "SWAP TO TANK SPEC!" and \\Inteface\LFGFRAME\UI-LFG-ICON-ROLES-TANK.blp -- icon path
    elseif aura_env.damagespec[specID] and PlayerRole == "DAMAGE" then
        return "SWAP TO DAMAGE SPEC!" and \\Inteface\LFGFRAME\UI-LFG-ICON-ROLES-DAMAGE.blp -- icon path
    end
end



