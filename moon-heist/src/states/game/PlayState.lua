PlayState = Class{__includes = BaseState}

function PlayState:init()

    gSounds['field-music']:setLooping(true)
    gSounds['field-music']:play()

    self.currentSide = 'yellow'
    self.resources = {
        ['money'] = 2000,
        ['food'] = 2000,
        ['energy'] = 2000,
        ['perception'] = 2000
    }

    self.sides = {Side({
        name = 'yellow',
        background = 'yellow-ground',
        facilities = FACILITY_DEFS['yellow'],
    })}

    -- self.sides = {Side({
    --     name = 'yellow',
    --     background = 'yellow-ground',
    --     facilities = FACILITY_DEFS['yellow'],
    -- }), Side({
    --     name = 'purple',
    --     background = 'purple-ground',
    --     facilities = FACILITY_DEFS['purple']
    -- })}
    
    -- Event.on('shift-left', function(params)
    --     self:beginShifting(-VIRTUAL_WIDTH, 0, params)
    -- end)
    --
    -- Event.on('shift-right', function(params)
    --     self:beginShifting(VIRTUAL_WIDTH, 0, params)
    -- end)

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
