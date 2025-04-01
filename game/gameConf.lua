--! file: gameConf.lua

local GameConf = {}

function GameConf:new()
    self.player = {}
    self.enemy = {}
end

function GameConf:setPlayer(player)
    self.player = player
end

function GameConf:setEnemy(enemy)
    self.enemy = enemy
end

return GameConf