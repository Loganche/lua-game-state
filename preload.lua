PreloadConf = {}

function PreloadConf:new()
    self.heroConf = {}
end

function PreloadConf:loadHeroConf()
    self.heroConf = {
        HeroConf:new(
            "Pudge",
            love.graphics.newImage("static/img/hero-pudge.png", { dpiscale = 3 }),
            Music.pudgeAttackSound,
            Music.pudgeImpactSound,
            love.graphics.newImage("static/img/hook.png", { dpiscale = 5 })
        ),
        HeroConf:new(
            "Viper",
            love.graphics.newImage("static/img/hero-viper.png"),
            Music.viperAttackSound,
            Music.viperImpactSound,
            love.graphics.newImage("static/img/poison.png", { dpiscale = 5 })
        ),
    }
end

return PreloadConf