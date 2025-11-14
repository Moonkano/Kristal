local Testing, super = Class(Wave)

function Testing:init()
    super.init(self)

    self.time = 5
end

function Testing:onStart()
    local x = SCREEN_WIDTH / 2
    local y = SCREEN_HEIGHT / 2
    local bullet = self:spawnBullet("bullets/smallbullet", x, y)
    bullet.physics.speed = 4
    bullet.rotation = math.rad(180)
    bullet.physics.match_rotation = true

end

function Testing:update()

    super.update(self)
end

return Testing