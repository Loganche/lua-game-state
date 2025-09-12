--! file: player.lua
local Entity = require("lib.entity")

local Player = Entity:extend()

local Music = require("music")
Music:load()

function Player:update(dt)
    if love.keyboard.isDown("left") then
        self.x = self.x - self:move(dt)
    end
    if love.keyboard.isDown("right") then
        self.x = self.x + self:move(dt)
    end

    self:collision()
end

function Player:move(dt)
    -- movement
    return self.speed * dt
end

function Player:windowCollisionSideEffects()
    -- side effects of entity for window collision
    -- no side effects of collision with wall
end

function Player:attackSound()
    -- stop attack sound
    -- play attack sound
    Music.playerAttackSound:stop()
    Music.playerAttackSound:play()
end

function Player:damageSound()
    -- stop attack & impact sounds
    -- play impact sound
    Music.enemyAttackSound:stop()
    Music.enemyImpactSound:stop()
    Music.enemyImpactSound:play()
end

return Player