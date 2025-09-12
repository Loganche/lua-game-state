--! file: gameConf.lua

local GameConf = {}

function GameConf:new()
    self.player = {}
    self.enemy = {}
    -- aray of all heroes from json configs
    self.heroConf = {}
end

function GameConf:setPlayer(player)
    self.player = player
end

function GameConf:setEnemy(enemy)
    self.enemy = enemy
end

function GameConf:addHeroConf(heroConf)
    table.insert(self.heroConf, heroConf)
end

function GameConf:getPlayerHeroConf()
    return self.heroConf[0]
end

function GameConf:getEnemyHeroConf()
    return self.heroConf[1]
end

return GameConf