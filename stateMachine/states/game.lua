local StateMachine = require("stateMachine.stateMachineInterface")

local Game = {}

local Player = require("game.src.player")
local Enemy = require("game.src.enemy")

PlayerBullets = {}
SnakeBullets = {}


function Game:enter()
    print("Entered Game")
    self.player = Player()
    self.enemy = Enemy()
    self.playerBullets = PlayerBullets
    self.snakeBullets = SnakeBullets
end

function Game:update(dt)
    self.player:update(dt)
    self.enemy:update(dt)

    if self.player.health <= 0 or self.enemy.health <= 0 then
        Result['player'] = self.player.health
        Result['enemy'] = self.enemy.health
        for i, _ in pairs(self.playerBullets) do self.playerBullets[i] = nil end
        for i, _ in pairs(self.snakeBullets) do self.snakeBullets[i] = nil end
        StateMachine:nextState()
    end

    for i, v in ipairs(self.playerBullets) do
        v:update(dt)
        v:checkCollision(self.enemy)

        if v.dead then
            table.remove(self.playerBullets, i)
        end
    end

    for i, v in ipairs(self.snakeBullets) do
        v:update(dt)
        v:checkCollision(self.player)

        if v.dead then
            table.remove(self.snakeBullets, i)
        end
    end
end

function Game:draw()
    self.player:draw()
    self.enemy:draw()

    for i, v in ipairs(self.playerBullets) do
        v:draw()
    end

    for i, v in ipairs(self.snakeBullets) do
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
    print("Exited Game")
end

function Game:__tostring()
    return 'Game', 'Next'
end

return Game
