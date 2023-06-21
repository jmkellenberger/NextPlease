local race_class_matrix = {
    ["Dwarf"] = { "Hunter", "Paladin", "Priest", "Rogue", "Warrior" },
    ["Gnome"] = { "Mage", "Rogue", "Warlock", "Warrior" },
    ["Human"] = { "Mage", "Paladin", "Priest", "Rogue", "Warlock", "Warrior" },
    ["Night Elf"] = { "Druid", "Hunter", "Priest", "Rogue", "Warrior" },
    ["Orc"] = { "Hunter", "Rogue", "Shaman", "Warlock", "Warrior" },
    ["Tauren"] = { "Druid", "Hunter", "Shaman", "Warrior" },
    ["Troll"] = { "Hunter", "Mage", "Priest", "Rogue", "Shaman", "Warrior" },
    ["Undead"] = { "Mage", "Priest", "Rogue", "Warlock", "Warrior" }
}

local races = {}
for race, _ in pairs(race_class_matrix) do
    races[#races + 1] = race
end

local NextPlease_EventFrame = CreateFrame("Frame")
NextPlease_EventFrame:RegisterEvent("PLAYER_DEAD")
NextPlease_EventFrame:SetScript("OnEvent",
    function(self, event, ...)
        local race = races[math.random(#races)]
        local classes = race_class_matrix[race]
        local class = classes[math.random(#classes)]
        local article = "a"
        if race == "Orc" or race == "Undead" then
            article = "an"
        end

        print(string.format("You died! You will be reincarnated as %s %s %s.", article, race, class))
    end)
