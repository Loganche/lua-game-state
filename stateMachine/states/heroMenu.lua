local StateMachine = require("stateMachine.stateMachineInterface")

local GameConf = require("game.gameConf")
local Player = require("game.playerEntity")
local Enemy = require("game.enemyEntity")
local Music = require("music")
Music:load()

local HeroMenu = {}

-- make dynamic list from heroConfig
local items = { "Pudge", "Viper", "Back" }
local selected = 1

function HeroMenu:enter()
end

function HeroMenu:update(dt)
end

function HeroMenu:draw()
    for i, v in ipairs(items) do
        if i == selected then
            love.graphics.setColor(0, 1, 0)
        else
            love.graphics.setColor(1, 1, 1)
        end
        love.graphics.print(v, 100, 50 + (i - 1) * 30)
    end
end

function HeroMenu:keypressed(key, scancode, isrepeat)
    if key == "return" then
        StateMachine:nextState()
    end

    if key == "up" then
        selected = math.max(1, selected - 1)
    elseif key == "down" then
        selected = math.min(#items, selected + 1)
    end
end

function HeroMenu:quit()
    -- for player x=300 y=20 direction=1
    -- for enemy x=325 y=400 direction=-1
    -- change to initializing from heroConfig list items
    if items[selected] == "Pudge" then
        GameConf:setPlayer(Player(300, 20, 500, 100,
            love.graphics.newImage("static/img/hero-pudge.png", { dpiscale = 3 }),
            1, 700, love.graphics.newImage("static/img/hook.png", { dpiscale = 5 })))
        GameConf:setEnemy(Enemy(325, 400, 100, 100,
            love.graphics.newImage("static/img/hero-viper.png"),
            -1, 350, love.graphics.newImage("static/img/poison.png", { dpiscale = 5 })))
    elseif items[selected] == "Viper" then
        GameConf:setPlayer(Player(300, 20, 500, 100,
            love.graphics.newImage("static/img/hero-viper.png"),
            1, 700, love.graphics.newImage("static/img/poison.png", { dpiscale = 5 })))
        GameConf:setEnemy(Enemy(325, 400, 100, 100,
            love.graphics.newImage("static/img/hero-pudge.png", { dpiscale = 3 }),
            -1, 350, love.graphics.newImage("static/img/hook.png", { dpiscale = 5 })))
    end
end

function HeroMenu:__tostring()
    return 'HeroMenu', items[selected]
end

return HeroMenu
