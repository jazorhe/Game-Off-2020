NewTurnTransitionState = Class{__includes = BaseState}

function NewTurnTransitionState:init(def)
    self.turn = def.turn
    self.bgcolour = def.bgcolour
    self.textcolour = def.textcolour
    self.darkcolour = def.darkcolour
    -- self.opacity = 1
    self.x = VIRTUAL_WIDTH
    self.y = VIRTUAL_HEIGHT / 2 - 20
    -- self.time = time

    Timer.tween(0.3, {
        [self] = {x = 150}
    })
    :finish(function()
        Timer.tween(1.4, {
            [self] = {x = 100}
        })
        :finish(function()
            Timer.tween(0.3, {
                [self] = {x = - VIRTUAL_WIDTH}
            })
            :finish(function()
                gStateStack:pop()
            end)
        end)
    end)
end

function NewTurnTransitionState:render()
    love.graphics.setColor(self.darkcolour)
    love.graphics.rectangle('fill', self.x + 15, self.y, VIRTUAL_WIDTH - 200, 40)
    love.graphics.polygon('fill', self.x + 15, self.y, self.x + 15, self.y + 40, self.x - 5, self.y + 20)

    love.graphics.setColor(self.bgcolour)
    love.graphics.rectangle('fill', self.x, self.y - 10, VIRTUAL_WIDTH - 200, 40)
    love.graphics.polygon('fill', self.x, self.y - 10, self.x, self.y + 30, self.x - 20, self.y + 10)

    -- love.graphics.setColor(self.darkcolour)
    -- love.graphics.polygon('fill', self.x + 10, self.y + 10, )
    -- love.graphics.setColor(self.bgcolour)
    -- love.graphics.polygon('fill', self.x, self.y, )
    --
    -- love.graphics.setColor(self.darkcolour)
    -- love.graphics.polygon('fill', self.x + 10, self.y + 10, )
    -- love.graphics.setColor(self.bgcolour)
    -- love.graphics.polygon('fill', self.x, self.y, )

    love.graphics.setFont(gFonts['large'])
    love.graphics.setColor(self.textcolour)
    love.graphics.printf('Month ' .. tostring(self.turn), self.x, VIRTUAL_HEIGHT / 2 - gFonts['large']:getHeight() / 2 - 10, VIRTUAL_WIDTH - 200, 'center')
    love.graphics.setColor(WHITE)
end
