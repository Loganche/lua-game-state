require("stateMachine.stateMachine")
local Background = require("background.background")

function love.load()
    love.graphics.setNewFont("static/IBMPlexSans-Regular.ttf", 20)

    Background:load()

    local mainMenu = require("stateMachine.states.mainMenu")
    GameStateManager:setState(mainMenu)
end

function love.update(dt)
    Background:update(dt)
    GameStateManager:update(dt)
end

function love.draw()
    Background:draw()
    GameStateManager:draw()
end

function love.keypressed(key, scancode, isrepeat)
    Background:keypressed(key, scancode, isrepeat)
    GameStateManager:keypressed(key, scancode, isrepeat)
end

function love.quit()
    GameStateManager:quit()
    return false
end
