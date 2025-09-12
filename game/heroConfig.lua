--! file: heroconfig.lua

local HeroConfig = {}
HeroConfig.__index = HeroConfig

function HeroConfig:new(configData)
    local self = setmetatable({}, HeroConfig)

    -- Validate configData structure (optional, for safety)
    assert(configData.name and type(configData.name) == "string", "name is required and must be a string")
    assert(configData.speed and type(configData.speed) == "number", "speed is required and must be a number")
    assert(configData.health and type(configData.health) == "number", "health is required and must be a number")
    assert(configData.img and type(configData.img) == "string", "img is required and must be a string path")
    assert(configData.imgScale and type(configData.imgScale) == "number", "imgScale is required and must be a number")
    assert(configData.bulletSpeed and type(configData.bulletSpeed) == "number",
        "bulletSpeed is required and must be a number")
    assert(configData.bulletImg and type(configData.bulletImg) == "string", "bulletImg is required and must be a string path")
    assert(configData.bulletImgScale and type(configData.bulletImgScale) == "number",
    "bulletImgScale is required and must be a number")
    assert(configData.attackSound and type(configData.attackSound) == "string",
        "attackSound is required and must be a string")
    assert(configData.impactSound and type(configData.impactSound) == "string",
        "impactSound is required and must be a string")

    self.name = configData.name
    self.speed = configData.speed
    self.health = configData.health
    self.img = love.graphics.newImage(configData.img, { dpiscale = configData.imgScale })
    self.bulletSpeed = configData.bulletSpeed
    self.bulletImg = love.graphics.newImage(configData.bulletImg, { dpiscale = configData.bulletImgScale })
    self.attackSound = love.audio.newSource(configData.attackSound, "static")
    self.impactSound = love.audio.newSource(configData.impactSound, "static")

    

    return self
end

return HeroConfig
