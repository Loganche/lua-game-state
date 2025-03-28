--! file: enemy.lua
local Object = require("lib.classic")
local Bullet = require("game.bullet")

local Enemy = Object:extend()

local Music = require("music")
Music:load()

function Enemy:new()
    self.image = love.graphics.newImage("static/img/hero-viper.png")
    self.x = 325
    self.y = 450
    self.speed = 100
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.health = 100
end

function Enemy:update(dt)
    self.x = self.x + self.speed * dt

    local window_width = love.graphics.getWidth()
    if self.x < 0 then
        self.x = 0
        self.speed = - self.speed
    elseif self.x + self.width > window_width then
        self.x = window_width - self.width
        self.speed = - self.speed
    end
end

function Enemy:draw()
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", self.x, self.y - 15, self.health, 10)
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(self.image, self.x, self.y)
end

function Enemy:keyPressed(key)
    if key == "space" then
        table.insert(SnakeBullets, Bullet(self.x, self.y, -0.5, 700, "static/img/poison.png"))
        Music.enemyAttackSound:stop()
        Music.enemyAttackSound:play()
    end
end

function Enemy:damageSound()
    Music.playerAttackSound:stop()
    Music.playerImpactSound1:stop()
    Music.playerImpactSound2:stop()
    Music.playerImpactSound1:play()
    Music.playerImpactSound2:play()
end

return Enemy