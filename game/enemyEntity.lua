--! file: Enemy.lua
local Entity = require("lib.entity")

local Enemy = Entity:extend()

local Music = require("music")
Music:load()

-- TODO убрать звуковые эффекты, они будут зашиты в heroConf.lua

function Enemy:windowCollisionSideEffects()
    -- side effects of entity for window collision
    self.speed = -self.speed
end

function Enemy:attackSound()
    -- stop attack sound
    -- play attack sound
    Music.enemyAttackSound:stop()
    Music.enemyAttackSound:play()
end

function Enemy:damageSound()
    -- stop attack & impact sounds
    -- play impact sound
    Music.playerAttackSound:stop()
    Music.playerImpactSound1:stop()
    Music.playerImpactSound2:stop()
    Music.playerImpactSound1:play()
    Music.playerImpactSound2:play()
end

return Enemy