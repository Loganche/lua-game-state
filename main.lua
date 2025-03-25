local StateMachine = require("stateMachine.stateMachineInterface")
local StateMachineConf = require("stateMachine.stateMachineConf")
local Background = require("background.background")

function love.load()
    love.graphics.setNewFont("static/IBMPlexSans-Regular.ttf", 20)

    Background:load()

    local mainMenu = require("stateMachine.states.mainMenu")
    StateMachine.confState = StateMachineConf
    StateMachine:setState(mainMenu)
end

function love.update(dt)
    Background:update(dt)
    StateMachine:update(dt)
end

function love.draw()
    Background:draw()
    StateMachine:draw()
end

function love.keypressed(key, scancode, isrepeat)
    Background:keypressed(key, scancode, isrepeat)
    StateMachine:keypressed(key, scancode, isrepeat)
end

function love.quit()
    StateMachine:quit()
    return false
end
