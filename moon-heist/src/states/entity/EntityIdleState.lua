EntityIdleState = Class{__includes = EntityBaseState}

function EntityIdleState:init(entity)
    self.entity = entity
    self.entity.direction = 'down'
    self.entity:changeAnimation('idle-' .. self.entity.direction)
end

function EntityIdleState:update(dt)

end

function EntityIdleState:render(params)
    local anim = self.entity.currentAnimation
    love.graphics.setColor(WHITE)
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.entity.x) + params.baseX, math.floor(self.entity.y), 0, 0.5)
end
