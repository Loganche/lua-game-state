--! file: music.lua

local Music = {}
Music.__index = Music

function Music:new()
    local self = setmetatable({}, Music)
    self.initSound = nil
    self.endSound = nil
    self.enemyAttackSound = nil
    self.enemyImpactSound = nil
    self.playerAttackSound = nil
    self.playerImpactSound = nil
    return self
end

function Music:loadGameMusic()
    self.initSound = love.audio.newSource("static/sound/Game_start.mp3", "static")
    self.endSound = love.audio.newSource("static/sound/Game_end.mp3", "static")
end

function Music:loadPlayerMusic(attackSound, impactSound)
    if attackSound then
        self.playerAttackSound = attackSound
    else
        print("Warning: No player attack sound provided")
    end

    if impactSound then
        self.playerImpactSound = impactSound
    else
        print("Warning: No player impact sound provided")
    end
end

function Music:loadEnemyMusic(attackSound, impactSound)
    if attackSound then
        self.enemyAttackSound = attackSound
    end
    if impactSound then
        self.enemyImpactSound = impactSound
    end
end

local instance = nil

function Music.getInstance()
    if not instance then
        instance = Music:new()
    end
    return instance
end

return {
    Music = Music,
    getInstance = Music.getInstance
}
