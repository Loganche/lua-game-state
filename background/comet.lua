local Comet = {}

for i = -10, 10, 4 do
    table.insert(Comet, i)
end

function Comet:new()
    self.e = true

    self.dx = self[math.random(#self)]
    self.dy = self[math.random(#self)]

    if math.random(0, 2) > 1 then
        self.x = love.graphics.getWidth() / 2 - self.dx / math.abs(self.dx) * love.graphics.getWidth() / 2
        self.y = math.random(0, love.graphics.getHeight())
    else
        self.x = math.random(0, love.graphics.getWidth())
        self.y = love.graphics.getHeight() / 2 - self.dy / math.abs(self.dy) * love.graphics.getHeight() / 2
    end

    return self
end

function Comet:update(dt)
    self.x = self.x + self.dx * dt * 64
    self.y = self.y + self.dy * dt * 64

    if self.x < -love.graphics.getWidth() or self.x > love.graphics.getWidth() * 2
        or self.y < -love.graphics.getWidth() or self.y > love.graphics.getHeight() * 2 then
        self.e = nil
    end
end

function Comet:draw()
    for i = 16, 1, -1 do
        local c = 128 / i

        love.graphics.setColor(255, 255, 255, c)

        love.graphics.line(
            self.x, self.y,
            self.x - i * self.dx, self.y - i * self.dy
        )
    end
end

return Comet