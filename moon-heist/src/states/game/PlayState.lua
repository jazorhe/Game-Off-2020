PlayState = Class{__includes = BaseState}

function PlayState:init()

    gSounds['field-music']:setLooping(true)
    gSounds['field-music']:play()

    self.resources = {
        ['money'] = 2000,
        ['food'] = 2000,
        ['energy'] = 2000,
        ['perception'] = 2000
    }

    self.yellowSide = Side({
        name = 'yellow',
        colour = table.pack(rgb(217, 186, 22)),
        background = 'yellow-ground',
        facilities = FACILITY_DEFS['yellow'],
        baseX = 0
    })

    self.PurpleSide = Side({
        name = 'purple',
        colour = table.pack(rgb(171, 42, 232)),
        background = 'purple-ground',
        facilities = FACILITY_DEFS['purple'],
        baseX = VIRTUAL_WIDTH
    })

    self.sides = {self.yellowSide, self.PurpleSide}
    self.currentSide = self.yellowSide

    self.cameraX = 0
    self.cameraY = 0
    self.shifting = false

    Event.on('shift-right', function(params)
        self:beginShifting(self.PurpleSide, VIRTUAL_WIDTH, 0, params)
    end)

    Event.on('shift-left', function(params)
        self:beginShifting(self.yellowSide, -VIRTUAL_WIDTH, 0, params)
    end)

end

function PlayState:update(dt)
    for k, side in pairs(self.sides) do
        side:update(dt)
    end
end

function PlayState:render()

    for k, side in pairs(self.sides) do
        side:render()
    end

    love.graphics.setColor(rgb(190, 163, 165))
    love.graphics.setFont(gFonts['small'])
    love.graphics.printf('Money: ' .. tostring(self.resources['money']), 0, VIRTUAL_HEIGHT - 48, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Food: ' .. tostring(self.resources['money']), 0, VIRTUAL_HEIGHT - 36, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Energy: ' .. tostring(self.resources['money']), 0, VIRTUAL_HEIGHT - 24, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Perception: ' .. tostring(self.resources['money']), 0, VIRTUAL_HEIGHT - 12, VIRTUAL_WIDTH, 'center')

end
