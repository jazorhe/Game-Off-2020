FadeInState = Class{__includes = BaseState}

function FadeInState:init(color, time, onFadeComplete)
    self.statename = 'FadeInState'
    self.r = color.r
    self.g = color.g
    self.b = color.b
    self.maxOpacity = color.maxOpacity or 1
    self.opacity = 0
    self.time = time

    Timer.tween(self.time, {
        [self] = {opacity = self.maxOpacity}
    })
    :finish(function()
        gStateStack:pop()
        onFadeComplete()
    end)
end

function FadeInState:render()
    love.graphics.setColor(self.r, self.g, self.b, self.opacity)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)

    love.graphics.setColor(rgba(255, 255, 255, 255))
end
