local StateMachine = require("stateMachine.stateMachineInterface")

local GameResult = {
    result = {},
}

Result = {
    ['player'] = 0,
    ['enemy'] = 0,
}

function GameResult:enter()
    print("Entered GameResult")
    self.result = Result

    local Music = require("music")
    Music:load()
    Music.endSound:play()
end

function GameResult:update(dt)

end

function GameResult:draw()
    if Result['player'] > Result['enemy'] then
        love.graphics.print("Player wins!", 350, 250)
    else
        love.graphics.print("Enemy wins!", 350, 250)
    end
    love.graphics.print("Player - " .. Result['player'] .. "\nEnemy - " .. Result['enemy'], 350, 280)
end

function GameResult:keypressed(key, scancode, isrepeat)
    if key == "escape" then
        StateMachine:revertState()
    elseif key == "return" then
        StateMachine:nextState()
    end
end

function GameResult:quit()
    print("Exited GameResult")
end

function GameResult:__tostring()
    return 'GameResult', 'Next'
end

return GameResult
