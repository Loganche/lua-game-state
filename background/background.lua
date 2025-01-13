local utf8 = require("utf8")

local Background = {
    stars = nil,
    comet = nil,
    comets = {},
}

function Background:load()
    self.stars = require "background.stars"
    self.comet = require "background.comet"
end

function Background:update(dt)
    self.stars:update()
    for i, c in ipairs(self.comets) do
        if c.e then
            c:update(dt)
        else
            table.remove(self.comets, i)
        end
    end
end

function Background:draw()
    self.stars:draw()
    for _, c in ipairs(self.comets) do
        if c.e then c:draw() end
    end

    love.graphics.print("C - create comet\n" .. utf8.char(8592) .. utf8.char(8594) .. " - movement\nSpace - shoot", 500,
    50)
end

function Background:keypressed(key, scancode, isrepeat)
    if key == "c" then
        table.insert(self.comets, self.comet:new())
    end
end

return Background
