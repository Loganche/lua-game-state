--! file: player.lua
local Object = require("game.lib.ext.classic")
local Bullet = require("game.src.bullet")

local Player = Object:extend()

local Music = require("music")
Music:load()

function Player:new()
    self.image = love.graphics.newImage("game/assets/hero-pudge.png", {dpiscale = 3})
    self.x = 300
    self.y = 20
    self.speed = 500
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.health = 100
end

function Player:update(dt)
    if love.keyboard.isDown("left") then
        self.x = self.x - self.speed * dt
    end
    if love.keyboard.isDown("right") then
        self.x = self.x + self.speed * dt
    end

    local window_width = love.graphics.getWidth()
    if self.x < 0 then
        self.x = 0
    elseif self.x + self.width > window_width then
        self.x = window_width - self.width
    end
end

function Player:draw()
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", self.x, self.y - 15, self.health, 10)
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(self.image, self.x, self.y)
end

function Player:keyPressed(key)
    if key == "space" then
        table.insert(PlayerBullets, Bullet(self.x, self.y, 1, "game/assets/hook.png"))
        Music.playerAttackSound:stop()
        Music.playerAttackSound:play()
    end
end

function Player:playImpactSound()
    Music.enemyAttackSound:stop()
    Music.enemyImpactSound:stop()
    Music.enemyImpactSound:play()
end

return Player