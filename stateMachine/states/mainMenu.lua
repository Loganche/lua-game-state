local StateMachine = require("stateMachine.stateMachineInterface")

local MainMenu = {}

local items = {"Start", "Quit"}
local selected = 1

function MainMenu:enter()
    local Music = require("music")
    Music:load()
    Music.initSound:play()
end

function MainMenu:update(dt)
end

function MainMenu:draw()
    for i, v in ipairs(items) do
        if i == selected then
            love.graphics.setColor(0, 1, 0)
        else
            love.graphics.setColor(1, 1, 1)
        end
        love.graphics.print(v, 100, 50 + (i - 1) * 30)
    end
end

function MainMenu:keypressed(key, scancode, isrepeat)
    if key == "return" then
        StateMachine:nextState()
    end

    if key == "up" then
        selected = math.max(1, selected - 1)
    elseif key == "down" then
        selected = math.min(#items, selected + 1)
    end
end

function MainMenu:quit()
end

function MainMenu:__tostring()
    return 'MainMenu', items[selected]
end

return MainMenu
