local StateMachine = require("stateMachine.stateMachineInterface")

local GameConf = require("game.conf.gameConf")
local HeroConfigModule = require("game.conf.heroConfigManager")
local Player = require("game.playerEntity")
local Enemy = require("game.enemyEntity")
local Music = require("game.conf.music")

local HeroMenu = {}

-- Dynamically generate hero list from configs
local heroConfigManager = HeroConfigModule.getInstance()
local gameConf = GameConf.getInstance()
local music = Music.getInstance()
local items = {}
local selected = 1

function HeroMenu:enter()
    -- Populate items with hero names from configs
    items = {}
    for name, _ in pairs(heroConfigManager:getHeroConfigs()) do
        table.insert(items, name)
    end
    table.insert(items, "Back")
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

    local selectedHero = items[selected]
    local selectedEnemy = items[math.random(#items - 1)]
    if selectedHero ~= "Back" then
        print("Hero is " .. selectedHero .. " and Enemy is " .. selectedEnemy)
        local heroConfig = heroConfigManager:getHeroConfig(selectedHero)
        local enemyConfig = heroConfigManager:getHeroConfig(selectedEnemy)

        music:loadPlayerMusic(heroConfig.attackSound, heroConfig.impactSound)
        music:loadEnemyMusic(enemyConfig.attackSound, enemyConfig.impactSound)

        gameConf:setPlayer(Player(
            300, 20,
            heroConfig.speed,
            heroConfig.health,
            heroConfig.img,
            1,
            heroConfig.bulletSpeed,
            heroConfig.bulletImg
        ))

        gameConf:setEnemy(Enemy(
            325, 400,
            enemyConfig.speed,
            enemyConfig.health,
            enemyConfig.img,
            -1,
            enemyConfig.bulletSpeed,
            enemyConfig.bulletImg
        ))
    end
end

function HeroMenu:__tostring()
    return 'HeroMenu', items[selected]
end

return HeroMenu
