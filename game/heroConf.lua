--! file: heroConf.lua

local HeroConf = {}

-- Entity:new(x, y, speed, health, img, bulletDirection, bulletSpeed, bulletImg)
-- TODO выделить - параметры героя, статические файлы героя, параметры пули, статические файлы пули
-- все сложить по отдельным структурам, а heroConf будет объединяющей структурой
function HeroConf:new(name, img, attackSound, impactSound, bulletImg)
    self.name = name
    self.img = img
    self.attackSound = attackSound
    self.impactSound = impactSound
    self.bulletImg = bulletImg
end

function HeroConf:attackSound()
    -- stop attack sound
    -- play attack sound
    self.attackSound:stop()
    self.attackSound:play()
end

function HeroConf:impactSound()
    -- stop attack sound
    -- stop impact sound
    -- play impact sound
    self.attackSound:stop()
    self.impactSound:stop()
    self.impactSound:play()
end

return HeroConf
