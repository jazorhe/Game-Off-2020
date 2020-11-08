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

    Event.on('resource-management', function(params)
        self:modifyResource(params)
    end)

end

function PlayState:update(dt)

    if love.keyboard.wasPressed('d') and not self.shifting and self.currentSide.name == 'yellow' then
        Event.dispatch('shift-right', {})
    end

    if love.keyboard.wasPressed('a') and not self.shifting and self.currentSide.name == 'purple' then
        Event.dispatch('shift-left', {})
    end

    self.currentSide:update(dt)
    if self.nextSide then
        self.nextSide:update(dt)
    end

end

function PlayState:render()
    love.graphics.push()
    if self.shifting then
        love.graphics.translate(-math.floor(self.cameraX), -math.floor(self.cameraY))
    end

    self.currentSide:render(self.resources)
    if self.nextSide then
        self.nextSide:render(self.resources)
    end
    love.graphics.pop()
end

function PlayState:beginShifting(nextSide, shiftX, shiftY, params)
    gSounds['blip']:play()

    self.shifting = true
    self.nextSide = nextSide

    Timer.tween(1, {
        [self] = {cameraX = shiftX, cameraY = shiftY},
    }):finish(function()
        self.currentSide.baseX = -shiftX
        self:finishShifting(nextSide)
    end)
end

function PlayState:finishShifting(nextSide)
    self.cameraX = 0
    self.cameraY = 0
    self.shifting = false
    self.currentSide = nextSide
    self.currentSide.baseX = 0
    self.nextSide = nil
end


function PlayState:modifyResource(params)
    self.resources['money'] = self.resources['money'] - params.resourceTable['money']
    self.resources['food'] = self.resources['food'] - params.resourceTable['food']
    self.resources['energy'] = self.resources['energy'] - params.resourceTable['energy']
    self.resources['perception'] = self.resources['perception'] - params.resourceTable['perception']
end
