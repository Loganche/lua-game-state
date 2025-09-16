--! file: player.lua
local Entity = require("game.base.entity")
local Music = require("game.conf.music")
local music = Music.getInstance()

local Player = Entity:extend()


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
    music.playerAttackSound:stop()
    music.playerAttackSound:play()
end

function Player:damageSound()
    -- stop attack & impact sounds
    -- play impact sound
    music.enemyAttackSound:stop()
    music.enemyImpactSound:stop()
    music.enemyImpactSound:play()
end

return Player