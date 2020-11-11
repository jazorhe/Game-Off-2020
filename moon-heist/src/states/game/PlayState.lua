PlayState = Class{__includes = BaseState}

function PlayState:init()

    gSounds['yellow-theme']:setLooping(true)
    gSounds['purple-theme']:setLooping(true)
    gSounds['yellow-theme']:setVolume(1)
    gSounds['purple-theme']:setVolume(0)
    gSounds['yellow-theme']:play()
    gSounds['purple-theme']:play()

    self.currentTurn = 0
    self.resources = INITIAL_RESOURCES

    self.yellowSide = Side({
        name = 'yellow',
        colour = YELLOW,
        background = 'yellow-ground',
        facilities = FACILITY_DEFS['yellow'],
        baseX = 0
    })

    self.PurpleSide = Side({
        name = 'purple',
        colour = PURPLE,
        background = 'purple-ground',
        facilities = FACILITY_DEFS['purple'],
        baseX = VIRTUAL_WIDTH
    })

    self.sides = {self.yellowSide, self.PurpleSide}
    self.currentSide = self.yellowSide

    self.cameraX = 0
    self.cameraY = 0
    self.shifting = false

    self:startNewTurn()

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

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        if self.currentTurn < MAX_TURN then
            self:endCurrentTurn()
            self:startNewTurn()
        else
            self:endCurrentTurn()
        end
    end

    self.currentSide:update(dt, {
        resources = self.resources,
    })
    if self.nextSide then
        self.nextSide:update(dt, {
            resources = self.resources,
            })
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

    love.graphics.setColor(rgb(196, 131, 131))
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 40, 0, 80, 30)
    love.graphics.setColor(rgb(255, 255, 255))
    love.graphics.printf('Month ' .. tostring(self.currentTurn), VIRTUAL_WIDTH / 2 - 40, 10, 80, 'center')
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
    if self.currentSide.name == 'yellow' then
        gSounds['yellow-theme']:setVolume(1)
        gSounds['purple-theme']:setVolume(0)
    else
        gSounds['yellow-theme']:setVolume(0)
        gSounds['purple-theme']:setVolume(1)
    end
end


function PlayState:checkResource(params)
    if self.resources['money'] + params.resourceTable['money'] < 0 or self.resources['food'] + params.resourceTable['food'] < 0 or self.resources['energy'] + params.resourceTable['energy'] < 0 or self.resources['perception'] + params.resourceTable['perception'] < 0 then
        return false
    end
    return true
end

function PlayState:modifyResource(params)
    self.resources['money'] = self.resources['money'] + params.resourceTable['money']
    self.resources['food'] = self.resources['food'] + params.resourceTable['food']
    self.resources['energy'] = self.resources['energy'] + params.resourceTable['energy']
    self.resources['perception'] = self.resources['perception'] + params.resourceTable['perception']
end

function PlayState:startNewTurn()
    self.currentTurn = self.currentTurn + 1
    if self.currentTurn ~= 1 then
        for k, side in pairs(self.sides) do
            for m, facility in pairs(side.facilities) do
                self:modifyResource({
                    resourceTable = facility.regCost[facility.currentLevel]
                })
                self:modifyResource({
                    resourceTable = facility.regEarn[facility.currentLevel]
                })
            end
        end
    end
end

function PlayState:endCurrentTurn()
    self:evaluateEndTurn()
end

function PlayState:evaluateEndTurn()
    if false then
        self:gameOver()
    end
end

function PlayState:gameOver()
    gStateStack:push(FadeInState({
        r = 255, g = 255, b = 255
    }, 1,
    function()
        gStateStack:pop()

        gStateStack:push(GameOverState())
        gStateStack:push(FadeOutState({
            r = 255, g = 255, b = 255
        }, 1,
        function() end))
    end))
end
