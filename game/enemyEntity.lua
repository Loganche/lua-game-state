--! file: Enemy.lua
local Entity = require("lib.entity")
local Music = require("music")
local music = Music.getInstance()

local Enemy = Entity:extend()


function Enemy:windowCollisionSideEffects()
    -- side effects of entity for window collision
    self.speed = -self.speed
end

function Enemy:attackSound()
    -- stop attack sound
    -- play attack sound
    music.enemyAttackSound:stop()
    music.enemyAttackSound:play()
end

function Enemy:damageSound()
    -- stop attack & impact sounds
    -- play impact sound
    music.playerAttackSound:stop()
    music.playerImpactSound:stop()
    music.playerImpactSound:play()
end

return Enemy