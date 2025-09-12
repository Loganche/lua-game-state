local Music = {
    initSound = nil,
    endSound = nil,
    enemyAttackSound = nil,
    enemyImpactSound = nil,
    playerAttackSound = nil,
    playerImpactSound = nil,
    --for heroconf
    viperAttackSound = nil,
    viperImpactSound = nil,
    pudgeAttackSound = nil,
    pudgeImpactSound = nil,
}

-- TODO сейчас звуки захардкожены для игрока и противника, в конфигах надо сделать их универсальными
function Music:load()
    self.initSound = love.audio.newSource("static/sound/Game_start.mp3", "static")
    self.endSound = love.audio.newSource("static/sound/Game_end.mp3", "static")
    self.enemyAttackSound = love.audio.newSource("static/sound/Viper_attack.mp3", "static")
    self.enemyImpactSound = love.audio.newSource("static/sound/Viper_impact.mp3", "static")
    self.playerAttackSound = love.audio.newSource("static/sound/Pudge_attack.mp3", "static")
    self.playerImpactSound = love.audio.newSource("static/sound/Pudge_impact1.mp3", "static")
    -- TODO somehow separate this logic from heroconfig paths and make it dynamicly initializable
    self.viperAttackSound = love.audio.newSource("static/sound/Viper_attack.mp3", "static")
    self.viperImpactSound = love.audio.newSource("static/sound/Viper_impact.mp3", "static")
    self.pudgeAttackSound = love.audio.newSource("static/sound/Pudge_attack.mp3", "static")
    self.pudgeImpactSound = love.audio.newSource("static/sound/Pudge_impact1.mp3", "static")
end

return Music
