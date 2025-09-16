--! file: gameConf.lua

local GameConf = {}
GameConf.__index = GameConf

function GameConf:new()
    local self = setmetatable({}, GameConf)
    self.player = {}
    self.enemy = {}
    return self
end

function GameConf:setPlayer(player)
    self.player = player
end

function GameConf:setEnemy(enemy)
    self.enemy = enemy
end

function GameConf:getPlayer()
    return self.player
end

function GameConf:getEnemy()
    return self.enemy
end

local instance = nil

function GameConf.getInstance()
    if not instance then
        instance = GameConf:new()
    end
    return instance
end

return {
    GameConf = GameConf,
    getInstance = GameConf.getInstance
}
