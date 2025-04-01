local mainMenu = require("stateMachine.states.mainMenu")
local heroMenu = require("stateMachine.states.heroMenu")
local startMenu = require("stateMachine.states.startMenu")
local game = require("stateMachine.states.game")
local gameResult = require("stateMachine.states.gameResult")
local quit = require("stateMachine.states.quit")

local StateMachineConf = {
    ['MainMenu'] = {
        ['Start'] = heroMenu,
        ['Quit'] = quit,
    },
    ['HeroMenu'] = {
        ['Pudge'] = startMenu,
        ['Viper'] = startMenu,
        ['Back'] = mainMenu,
    },
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
}

return StateMachineConf
