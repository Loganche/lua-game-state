local Stars = {}

for i = 1, 1024 do
    Stars[i] = {}

    Stars[i].x, Stars[i].y, Stars[i].n =

        math.random(0, love.graphics.getWidth()),
        math.random(0, love.graphics.getHeight()),
        math.random(0, 255)
end

function Stars:update(dt)
    for k, _ in ipairs(self) do
        local m = math.random(-8, 8)

        self[k].n = self[k].n + m

        if self[k].n < 10 then
            self[k].n = 10
        elseif self[k].n > 255 then
            self[k].n = 255
        end
    end
end

function Stars:draw()
    for k, _ in ipairs(self) do
        local c = self[k].n
        love.graphics.setColor(255, 255, 255, c)
        love.graphics.points(self[k].x, self[k].y)
    end
end

return Stars