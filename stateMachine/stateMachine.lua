GameStateManager = require("stateMachine.gameStateManager")

local mainMenu = require("stateMachine.states.mainMenu")
local startMenu = require("stateMachine.states.startMenu")
local game = require("stateMachine.states.game")
local gameResult = require("stateMachine.states.gameResult")
local quit = require("stateMachine.states.quit")

StateMachine = {
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

function FindNextState(curState)
    local state, pos = curState.__tostring()
    local nextState = StateMachine[state][pos]

    print("Next state is", state, pos, nextState)

    if nextState == "dummy" then
        GameStateManager:reloadState()
    -- elseif nextState == "revert" then
    --     GameStateManager:setState(mainMenu)
    else
        GameStateManager:setState(nextState)
    end
end
