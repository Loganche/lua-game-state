local StateMachine = require("stateMachine.stateMachineInterface")

local GameConf = require("game.gameConf")
local Game = {}

function Game:enter()
    self.player = GameConf.player
    self.enemy = GameConf.enemy
end

function Game:update(dt)
    self.player:update(dt)
    self.enemy:update(dt)

    self:isFinished()

    self:bulletShot(dt, self.player.bullets, self.enemy, 20, 50)
    self:bulletShot(dt, self.enemy.bullets, self.player, 20, 0)
end

function Game:draw()
    self.player:draw()
    self.enemy:draw()

    for _, v in ipairs(self.player.bullets) do
        v:draw()
    end

    for _, v in ipairs(self.enemy.bullets) do
        v:draw()
    end
end

function Game:keypressed(key, scancode, isrepeat)
    if key == "escape" then
        StateMachine:revertState()
    end


    self.player:keyPressed(key)
    self.enemy:keyPressed(key)
end

function Game:quit()
end

function Game:__tostring()
    return 'Game', 'Next'
end

function Game:bulletShot(dt, bullets, entity, healthDelta, speedDelta)
    for i, v in ipairs(bullets) do
        v:update(dt)
        if v:checkCollision(entity) then
            v:collisionSideEffects(entity, healthDelta, speedDelta)
        end

        if v.dead then
            table.remove(bullets, i)
        end
    end
end

function Game:isFinished()
    if self.player.health <= 0 or self.enemy.health <= 0 then
        Result['player'] = self.player.health
        Result['enemy'] = self.enemy.health
        for i, _ in pairs(self.player.bullets) do self.player.bullets[i] = nil end
        for i, _ in pairs(self.enemy.bullets) do self.enemy.bullets[i] = nil end
        StateMachine:nextState()
    end
end

return Game