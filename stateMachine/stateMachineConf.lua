local mainMenu = require("stateMachine.states.mainMenu")
local heroMenu = require("stateMachine.states.heroMenu")
local startMenu = require("stateMachine.states.startMenu")
local game = require("stateMachine.states.game")
local gameResult = require("stateMachine.states.gameResult")
local quit = require("stateMachine.states.quit")
local HeroConfigModule = require("game.heroConfigManager")

local function generateHeroMenuConfig()
    local heroConfigManager = HeroConfigModule.getInstance()
    if #heroConfigManager:getHeroConfigs() == 0 then
        -- Load configs from a directory containing JSON files
        local status, err = pcall(function()
            heroConfigManager:loadConfigsFromDirectory("heroes")
        end)

        if not status then
            print("Error loading hero configs: " .. tostring(err))
            return
        end
    end

    print("Generating Hero Menu Configuration:")
    local heroMenuConfig = {
        ['Back'] = mainMenu
    }

    -- Dynamically add heroes from configurations
    for heroName, _ in pairs(heroConfigManager:getHeroConfigs()) do
        heroMenuConfig[heroName] = startMenu
        print("  - Found Hero: " .. heroName)
    end

    return heroMenuConfig
end

local StateMachineConf = setmetatable({
    ['MainMenu'] = {
        ['Start'] = heroMenu,
        ['Quit'] = quit,
    },
    ['HeroMenu'] = generateHeroMenuConfig(),
    ['StartMenu'] = {
        ['Play'] = game,
        ['Back'] = heroMenu,
    },
    ['Game'] = {
        ['Next'] = gameResult,
    },
    ['GameResult'] = {
        ['Next'] = mainMenu,
    },
    ['Quit'] = {},
}, {
    -- Add a metamethod to regenerate hero configs if needed
    __index = function(t, k)
        if k == 'HeroMenu' then
            return generateHeroMenuConfig()
        end
    end
})

return StateMachineConf
