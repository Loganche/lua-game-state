--! file: entity.lua
local Object = require("lib.classic")
local Bullet = require("game.bullet")

local Entity = Object:extend()

-- Entity реализует логику, HeroConf передает параметры для сущности

function Entity:new(x, y, speed, health, img, bulletDirection, bulletSpeed, bulletImg)
    self.x = x
    self.y = y
    self.speed = speed
    self.health = health
    self.image = img
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.bullets = {}
    self.bulletDirection = bulletDirection
    self.bulletSpeed = bulletSpeed
    self.bulletImg = bulletImg
end

function Entity:update(dt)
    self.x = self.x + self:move(dt)

    self:collision()
end

function Entity:draw()
    self:drawHealthBar()
    self:drawEntityIcon()
end

function Entity:keyPressed(key)
    self:shoot(key)
end

function Entity:move(dt)
    -- movement
    return self.speed * dt
end

function Entity:collision()
    -- entity collision with window borders
    local window_width = love.graphics.getWidth()
    if self.x < 0 then
        self.x = 0
        self:windowCollisionSideEffects()
    elseif self.x + self.width > window_width then
        self.x = window_width - self.width
        self:windowCollisionSideEffects()
    end
end

function Entity:windowCollisionSideEffects()
    -- side effects of entity for window collision
    -- for example: change speed vector for npc to move the opposite direction
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

function Entity:shoot(key)
    if key == "space" then
        -- place bullet and play sound
        table.insert(self.bullets, Bullet(self.x, self.y, self.bulletDirection, self.bulletSpeed, self.bulletImg))
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
