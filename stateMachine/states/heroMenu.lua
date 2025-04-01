local StateMachine = require("stateMachine.stateMachineInterface")

local GameConf = require("game.gameConf")
local Player = require("game.playerEntity")
local Enemy = require("game.enemyEntity")

local HeroMenu = {}

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
    if items[selected] == "Pudge" then
        GameConf:setPlayer(Player(300, 20, 500, 100,
            love.graphics.newImage("static/img/hero-pudge.png", { dpiscale = 3 }),
            1, 700, "static/img/hook.png"))
        GameConf:setEnemy(Enemy(325, 400, 100, 100,
            love.graphics.newImage("static/img/hero-viper.png"),
            -1, 350, "static/img/poison.png"))
    elseif items[selected] == "Viper" then
        GameConf:setPlayer(Player(300, 20, 500, 100,
            love.graphics.newImage("static/img/hero-viper.png"),
            1, 700, "static/img/poison.png"))
        GameConf:setEnemy(Enemy(325, 400, 100, 100,
            love.graphics.newImage("static/img/hero-pudge.png", { dpiscale = 3 }),
            -1, 350, "static/img/hook.png"))
    end
end

function HeroMenu:__tostring()
    return 'HeroMenu', items[selected]
end

return HeroMenu
