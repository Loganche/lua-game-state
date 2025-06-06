local StateMachine = require("stateMachine.stateMachineInterface")

local StartMenu = {}

local items = { "Play", "Back" }
local selected = 1

function StartMenu:enter()
end

function StartMenu:update(dt)
end

function StartMenu:draw()
    for i, v in ipairs(items) do
        if i == selected then
            love.graphics.setColor(0, 1, 0)
        else
            love.graphics.setColor(1, 1, 1)
        end
        love.graphics.print(v, 100, 50 + (i - 1) * 30)
    end
end

function StartMenu:keypressed(key, scancode, isrepeat)
    if key == "return" then
        StateMachine:nextState()
    end

    if key == "up" then
        selected = math.max(1, selected - 1)
    elseif key == "down" then
        selected = math.min(#items, selected + 1)
    end
end

function StartMenu:quit()
end

function StartMenu:__tostring()
    return 'StartMenu', items[selected]
end

return StartMenu
