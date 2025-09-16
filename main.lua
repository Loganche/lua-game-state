local StateMachine = require("stateMachine.stateMachineInterface")
local Background = require("background.background")
local StateMachineConf = require("stateMachine.stateMachineConf")
local Music = require("game.conf.music")

local music = Music.getInstance()
music:loadGameMusic()

function love.load()
    -- Set default font
    love.graphics.setNewFont("static/font/IBMPlexSans-Regular.ttf", 20)

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
