FadeOutState = Class{__includes = BaseState}

function FadeOutState:init(color, time, onFadeComplete)
    self.statename = 'FadeOutState'
    self.r = color.r
    self.g = color.g
    self.b = color.b
    self.opacity = color.maxOpacity or 1
    self.time = time

    Timer.tween(self.time, {
        [self] = {opacity = 0}
    })
    :finish(function()
        gStateStack:pop()
        onFadeComplete()
    end)
end

function FadeOutState:update(dt)

end

function FadeOutState:render()
    love.graphics.setColor(self.r, self.g, self.b, self.opacity)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)

    love.graphics.setColor(rgba(255, 255, 255, 255))
end
