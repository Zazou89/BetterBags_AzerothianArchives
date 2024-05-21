---@class BetterBags: AceAddon
local addon = LibStub('AceAddon-3.0'):GetAddon("BetterBags")

---@class Categories: AceModule
local categories = addon:GetModule('Categories')

-- Localization table
local locales = {
    ["enUS"] = {
        ["Azerothian Archives"] = "Azerothian Archives",
    },
    ["frFR"] = {
        ["Azerothian Archives"] = "Archives d’Azeroth",
    },
    ["deDE"] = {
        ["Azerothian Archives"] = "Archive von Azeroth",
    },
    ["esES"] = {
        ["Azerothian Archives"] = "Archivo de Azeroth",
    },
    ["itIT"] = {
        ["Azerothian Archives"] = "Archivi Azerothiani",
    },
    ["ptBR"] = {
        ["Azerothian Archives"] = "Arquivo Azerothiano",
    }
}

-- Detects current language
local currentLocale = GetLocale()

-- Function to get the translation
local function L(key)
    return locales[currentLocale] and locales[currentLocale][key] or locales["enUS"][key]
end

--Mysterious Fragments Containers
local Containers = {
    200285, --Dragonscale Expedition Insignia (Green)
    213389, --Ancient Centaur Diary
    213025, --Ancient Djaradin Bolt
    213020, --Ancient Drakonid Shovel
    213024, --Bloody Djaradin Mug
    213200, --Book of Horoscopes
    213365, --Carved Cave Crystal
    213215, --Carved Votive Stone
    213021, --Corked Drakonid Vial
    213359, --Cracked Drakonid Staff
    212687, --Crude Toy Ducky
    213357, --Crystal Scrying Bowl
    212978, --Dragon Painter's Palette
    213022, --Drakonid Blacksmith Hammer
    212976, --Drakonid Duck Carving
    212977, --Drakonid Sign Placard
    213183, --Makeshift Beaded Bracelet
    213023, --Oil-Drenched Djaradin Torch
    205223, --Ornamented Centaur Axe
    213382, --Partial Centaur Hunting Map
    212782, --Poorly Preserved Relic
    213208, --Pot of Pickled Ancheevies
    212650, --Pot of Tattooing Ink
    213204, --Ruby-Studded Locket
    212773, --Rusted Locket
    213375, --Satchel of Buried Valuables
    213192, --Scratched-Out List of Names
    212762, --Tarnished Horn Signet
    212769, --Tattered Wanted Poster
    213429, --Meticulous Archivist's Appendix
}
--Big Dig Tomes
local BigDigTomes = {
    213185, --Dusty Centaur Tome
    213175, --Dusty Djaradin Tome
    213188, --Dusty Dracthyr Tome
    213187, --Dusty Drakonid Tome
    213186, --Dusty Niffen Tome
    213190, --Preserved Djaradin Tome
    213189, --Preserved Dragonkin Tome
    213176, --Preserved Isles Tome
    213177, --Immaculate Tome
}
--Miscellaneous
local Miscellaneous = {
    213536, --Priceless Artifact
}

local allItems = {
    Containers,
    Miscellaneous,
    BigDigTomes
}

--Delete category before adding translations
categories:DeleteCategory("Azerothian Archives") 

--Wipe category too ensure the item list is up to date
categories:WipeCategory(L("Azerothian Archives"))

--Loop
for _, itemList in pairs(allItems) do
    for _, ItemID in pairs(itemList) do
        categories:AddItemToCategory(ItemID, L("Azerothian Archives"))
    end
end
