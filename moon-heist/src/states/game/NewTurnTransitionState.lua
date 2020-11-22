NewTurnTransitionState = Class{__includes = BaseState}

function NewTurnTransitionState:init(def)
    self.statename = 'NewTurnTransitionState'
    self.turn = def.turn
    self.bgcolour = def.bgcolour
    self.textcolour = def.textcolour
    self.darkcolour = def.darkcolour
    self.resources = def.resources
    -- self.opacity = 1
    self.x = VIRTUAL_WIDTH
    self.y = VIRTUAL_HEIGHT / 2 - 20
    -- self.time = time
    self.exited = false

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
                self.exited = true
            end)
        end)
    end)
end

function NewTurnTransitionState:update(dt)

end

function NewTurnTransitionState:render()
    love.graphics.setColor(self.darkcolour)
    love.graphics.rectangle('fill', self.x + 15, self.y, VIRTUAL_WIDTH - 200, 40)
    love.graphics.polygon('fill', self.x + 15, self.y, self.x + 15, self.y + 40, self.x - 5, self.y + 20)

    love.graphics.setColor(self.bgcolour)
    love.graphics.rectangle('fill', self.x, self.y - 10, VIRTUAL_WIDTH - 200, 40)
    love.graphics.polygon('fill', self.x, self.y - 10, self.x, self.y + 30, self.x - 20, self.y + 10)

    love.graphics.setFont(gFonts['large'])
    love.graphics.setColor(self.textcolour)
    love.graphics.printf('Month ' .. tostring(self.turn), self.x, VIRTUAL_HEIGHT / 2 - gFonts['large']:getHeight() / 2 - 10, VIRTUAL_WIDTH - 200, 'center')
    love.graphics.setColor(WHITE)

    if DEBUG and DEBUG_STATES then
        local alignment = 'left'
        local offsetX = 24
        local paddingY = 12
        local bottomY = 30
        if self.side == 'yellow' then
            alignment = 'left'
            offsetX = 24
        elseif self.side == 'purple' then
            alignment = 'right'
            offsetX = - 24
        end

        love.graphics.setFont(gFonts['medium'])
        love.graphics.printf('Month ' .. tostring(self.currentTurn),
            0, VIRTUAL_HEIGHT - bottomY - 7 * paddingY, VIRTUAL_WIDTH, 'center')


        love.graphics.setFont(gFonts['small'])
        love.graphics.printf('Trust: ' .. tostring(self.trust) .. " %",
            0, VIRTUAL_HEIGHT - bottomY - 5 * paddingY, VIRTUAL_WIDTH, 'center')

        love.graphics.printf('Money: ' .. tostring(self.resources['money']),
            0, VIRTUAL_HEIGHT - bottomY - 4 * paddingY, VIRTUAL_WIDTH, 'center')
        love.graphics.printf('Food: ' .. tostring(self.resources['food']),
            0, VIRTUAL_HEIGHT - bottomY - 3 * paddingY, VIRTUAL_WIDTH, 'center')
        love.graphics.printf('Energy: ' .. tostring(self.resources['energy']),
            0, VIRTUAL_HEIGHT - bottomY - 2 * paddingY, VIRTUAL_WIDTH, 'center')
        love.graphics.printf('Amenity: ' .. tostring(self.resources['amenity']),
            0, VIRTUAL_HEIGHT - bottomY - 1 * paddingY, VIRTUAL_WIDTH, 'center')
    end

end
