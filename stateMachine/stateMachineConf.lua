local mainMenu = require("stateMachine.states.mainMenu")
local startMenu = require("stateMachine.states.startMenu")
local game = require("stateMachine.states.game")
local gameResult = require("stateMachine.states.gameResult")
local quit = require("stateMachine.states.quit")

local StateMachineConf = {
    ['MainMenu'] = {
        ['Start'] = startMenu,
        ['Quit'] = quit,
    },
    ['StartMenu'] = {
        ['Play'] = game,
        ['Back'] = mainMenu,
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
