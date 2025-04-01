local StateMachine = require("stateMachine.stateMachineInterface")

local Game = {}

local Player = require("game.playerEntity")
local Enemy = require("game.enemyEntity")
local Bullet = require("game.bullet")

PlayerBullets = {}
SnakeBullets = {}


function Game:enter()
    self.player = Player(300, 20, 500, 100,
        love.graphics.newImage("static/img/hero-pudge.png", { dpiscale = 3 }),
        1, 700, "static/img/hook.png")
    self.enemy = Enemy(325, 400, 100, 100,
        love.graphics.newImage("static/img/hero-viper.png"),
        -1, 350, "static/img/poison.png")
end

function Game:update(dt)
    self.player:update(dt)
    self.enemy:update(dt)

    if self.player.health <= 0 or self.enemy.health <= 0 then
        Result['player'] = self.player.health
        Result['enemy'] = self.enemy.health
        for i, _ in pairs(self.player.bullets) do self.player.bullets[i] = nil end
        for i, _ in pairs(self.enemy.bullets) do self.enemy.bullets[i] = nil end
        StateMachine:nextState()
    end

    healthDelta = 20
    speedDelta = 50
    for i, v in ipairs(self.player.bullets) do
        v:update(dt)
        if v:checkCollision(self.enemy) then
            v:collisionSideEffects(self.enemy, healthDelta, speedDelta)
        end

        if v.dead then
            table.remove(self.player.bullets, i)
        end
    end

    for i, v in ipairs(self.enemy.bullets) do
        v:update(dt)
        if v:checkCollision(self.player) then
            v:collisionSideEffects(self.player, healthDelta, speedDelta)
        end

        if v.dead then
            table.remove(self.enemy.bullets, i)
        end
    end
end

function Game:draw()
    self.player:draw()
    self.enemy:draw()

    for i, v in ipairs(self.player.bullets) do
        v:draw()
    end

    for i, v in ipairs(self.enemy.bullets) do
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

return Game
