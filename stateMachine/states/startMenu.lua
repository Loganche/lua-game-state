local StartMenu = {}

local items = { "Play", "Back" }
local selected = 1

function StartMenu:enter()
    print("Entered StartMenu")
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
        FindNextState(self)
    end

    if key == "up" then
        selected = math.min(1, selected - 1)
    elseif key == "down" then
        selected = math.max(#items, selected + 1)
    end
end

function StartMenu:__tostring()
    return 'StartMenu', items[selected]
end

return StartMenu
