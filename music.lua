local Music = {
    initSound = nil,
    endSound = nil,
    enemyAttackSound = nil,
    enemyImpactSound = nil,
    playerAttackSound = nil,
    playerImpactSound1 = nil,
    playerImpactSound2 = nil,
}

function Music:load()
    self.initSound = love.audio.newSource("static/sound/Game_start.mp3", "static")
    self.endSound = love.audio.newSource("static/sound/Game_end.mp3", "static")
    self.enemyAttackSound = love.audio.newSource("static/sound/Viper_attack.mp3", "static")
    self.enemyImpactSound = love.audio.newSource("static/sound/Viper_impact.mp3", "static")
    self.playerAttackSound = love.audio.newSource("static/sound/Pudge_attack.mp3", "static")
    self.playerImpactSound1 = love.audio.newSource("static/sound/Pudge_impact1.mp3", "static")
    self.playerImpactSound2 = love.audio.newSource("static/sound/Pudge_impact2.mp3", "static")
end

return Music