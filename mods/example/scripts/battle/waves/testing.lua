local Testing, super = Class(Wave)

function Testing:init()
    super.init(self)

    self.time = 5
end

function Testing:onStart()
    -- gets dummy position and sets the bullet to come from the center of the dummy
    local dummy = self:getAttackers()[1]
    self.timer:everyInstant(1, function()
        local x, y = dummy:getRelativePos(dummy.width/2, dummy.height/2)
        -- loops six times to spawn 6 bullets.
        for i = 1, 6 do
            local bullet = 
        self:spawnBullet("bullets/smallbullet",x,y)
            bullet.physics.speed = 4
            bullet.physics.match_rotation = true
            -- stores angle from dummy position to soul position
            local target_angle = MathUtils.angle(x,y, Game.battle.soul.x,Game.battle.soul.y)
            -- Generates random decimal number between two inputs. (40 degree spread/)
            bullet.rotation =  target_angle + math.rad(MathUtils.random(-20,20))
        end
    end)
    self.timer:after(3, function()
        Assets.playSound("grab")
        
        local x, y =
        dummy:getRelativePos(dummy.width/2,dummy.height/2)

        local bullet = 
        self:spawnBullet("bullets/smallbullet", x,y)
        -- make this bullet double the size of a regular bullet
        bullet:setScale(4)
        bullet.physics.speed = 16
        bullet.rotation = MathUtils.angle(x,y, Game.battle.soul.x, Game.battle.soul.y)
        bullet.physics.match_rotation = true
        self.timer:every(1/15,function()
            --cancel timer if bullet is removed
            if bullet:isRemoved() then
                return false
            end
        -- spawn a new afterimage with 0.4 starting alpha
            local after_image = 
            AfterImage(bullet.sprite, 0.4)
            bullet:addChild(after_image)
        end)
    end)
    self.timer:after(3-24/30, function()
        dummy:alert()
    end)
    
    
end

function Testing:update()

    super.update(self)
end

return Testing