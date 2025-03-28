--! file: bullet.lua
local Object = require("lib.classic")

local Bullet = Object:extend()

function Bullet:new(x, y, direction, speed, img)
    self.image = love.graphics.newImage(img, {dpiscale = 5})
    self.x = x
    self.y = y
    self.speed = direction * speed
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
end

function Bullet:update(dt)
    self.y = self.y + self.speed * dt
end

function Bullet:draw()
    love.graphics.draw(self.image, self.x, self.y)
end

function Bullet:checkCollision(obj)
    local self_left = self.x
    local self_right = self.x + self.width
    local self_top = self.y
    local self_bottom = self.y + self.height

    local obj_left = obj.x
    local obj_right = obj.x + obj.width
    local obj_top = obj.y
    local obj_bottom = obj.y + obj.height

    if self_right > obj_left
        and self_left < obj_right
        and self_bottom > obj_top
        and self_top < obj_bottom then
            -- collision occured
            return true
    end
end

function Bullet:collisionSideEffects(obj, healthDelta, speedDelta)
    self.dead = true

    obj.health = obj.health - healthDelta
    obj.damageSound()

    --Increase enemy speed
    if obj.speed < 0 then
        obj.speed = obj.speed - speedDelta
    else
        obj.speed = obj.speed + speedDelta
    end
end

return Bullet