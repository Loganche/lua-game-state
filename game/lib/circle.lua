--! file: circle.lua
local Shape = require "shape"

local Circle = Shape:extend()

function Circle:new(x, y, radius)
    Circle.super.new(self, x, y)
    self.radius = radius
end

function Circle:draw(mode)
    love.graphics.circle(mode, self.x, self.y, self.radius)
end

return Circle