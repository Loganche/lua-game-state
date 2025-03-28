--! file: player.lua
local Object = require("game.lib.ext.classic")
local Bullet = require("game.src.bullet")

local Entity = Object:extend()

local Music = require("music")
Music:load()

function Entity:new(x, y, speed, health, img, bulletImg)
    self.x = x
    self.y = y
    self.speed = speed
    self.health = health
    self.image = img
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.bullets = {}
    self.bulletImg = bulletImg
end

function Entity:update(dt, direction)
    if direction == -1 then
        -- left
        self.x = -self:move(dt)
    else
        -- right
        self.x = self:move(dt)
    end

    self:collision()
end

function Entity:draw()
    self:drawHealthBar()
    self:drawEntityIcon()
end

function Entity:keyPressed(key)
    self:shoot(key, 1)
end

function Entity:move(dt)
    -- movement
end

function Entity:collision()
    -- entity collision with window borders
    local window_width = love.graphics.getWidth()
    if self.x < 0 then
        self.x = 0
        self:collisionSideEffects()
    elseif self.x + self.width > window_width then
        self.x = window_width - self.width
        self:collisionSideEffects()
    end
end

function Entity:collisionSideEffects()
    -- side effects of entity for window collision
end

function Entity:drawHealthBar()
    -- color of health bar
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", self.x, self.y - 15, self.health, 10)
end

function Entity:drawEntityIcon()
    -- color of icon
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(self.image, self.x, self.y)
end

function Entity:shoot(key, direction)
    if key == "space" then
        -- place bullet and play sound
        table.insert(self.bullets, Bullet(self.x, self.y, direction, self.bulletImg))
        self:attackSound()
    end
end

function Entity:attackSound()
    -- stop attack sound
    -- play attack sound
end

function Entity:damageSound()
    -- stop attack & impact sounds
    -- play impact sound
end

return Entity
