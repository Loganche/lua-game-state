--! file: heroconfigmanager.lua

local json = require("lib.dkjson")
local HeroConfig = require("game.conf.heroConfig")

local HeroConfigManager = {}
HeroConfigManager.__index = HeroConfigManager

function HeroConfigManager:new()
    local self = setmetatable({}, HeroConfigManager)
    self.heroConfigs = {}
    return self
end

function HeroConfigManager:addHeroConfig(configData)
    local heroConfig = HeroConfig:new(configData)
    if self.heroConfigs[heroConfig.name] ~= nil then
        print("Warning: HeroConfig for current name: " .. heroConfig.name .. " is already added. Rewriting...")
    end
    self.heroConfigs[heroConfig.name] = heroConfig
    print("Added config " .. heroConfig.name)
end

function HeroConfigManager:getHeroConfig(heroName)
    return self.heroConfigs[heroName]
end

function HeroConfigManager:getHeroConfigs()
    return self.heroConfigs
end

function HeroConfigManager:loadConfigFromFile(filePath)
    -- Check if the file exists
    if not love.filesystem.getInfo(filePath) then
        error("Could not find file: " .. filePath)
    end

    -- Read the JSON file
    local content = love.filesystem.read(filePath)

    -- Parse JSON data
    local configData = json.decode(content)

    -- Create a HeroConfig instance and add it to the list
    self:addHeroConfig(configData)
end

function HeroConfigManager:loadConfigsFromDirectory(directoryPath)
    -- Check if the directory exists
    if not love.filesystem.getInfo(directoryPath, "directory") then
        error("Could not find directory: " .. directoryPath)
    end

    -- Get a list of files in the directory
    local items = love.filesystem.getDirectoryItems(directoryPath)

    for _, file in ipairs(items) do
        if string.match(file, "%.json$") then
            print("Found file " .. file)
            self:loadConfigFromFile(directoryPath .. "/" .. file)
        end
    end
end

local instance = nil

function HeroConfigManager.getInstance()
    if not instance then
        instance = HeroConfigManager:new()
    end
    return instance
end

return {
    HeroConfigManager = HeroConfigManager,
    getInstance = HeroConfigManager.getInstance
}
