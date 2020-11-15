PlayState = Class{__includes = BaseState}

function PlayState:init()
    gSounds['yellow-theme']:setLooping(true)
    gSounds['purple-theme']:setLooping(true)
    gSounds['yellow-theme']:setVolume(1)
    gSounds['purple-theme']:setVolume(0)
    gSounds['yellow-theme']:play()
    gSounds['purple-theme']:play()

    self.currentTurn = 0
    self.resources = {
        ['money'] = 2000,
        ['food'] = 2000,
        ['energy'] = 2000,
        ['perception'] = 2000
    }

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

    self.currentEvents = {}

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

    Event.on('win-game', function(params)
        self:winGame(params)
    end)

end

function PlayState:update(dt)

    if love.keyboard.wasPressed('d') and not self.shifting and self.currentSide.name == 'yellow' then
        Event.dispatch('shift-right', {})
    end

    if love.keyboard.wasPressed('a') and not self.shifting and self.currentSide.name == 'purple' then
        Event.dispatch('shift-left', {})
    end

    if DEBUG then
        if love.keyboard.wasPressed('r') then
            self:gameOver()
        end
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
        currentTurn = self.currentTurn
    })
    if self.nextSide then
        self.nextSide:update(dt, {
            resources = self.resources,
            currentTurn = self.currentTurn
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

    -- love.graphics.print(tostring(self.currentEvents[1].state), 0, 0)

    love.graphics.pop()
    love.graphics.setColor(rgb(255, 255, 255))
end

function PlayState:beginShifting(nextSide, shiftX, shiftY, params)
    gSounds['blip']:play()

    self.shifting = true
    self.nextSide = nextSide

    if self.currentSide.name == 'yellow' then
        local startwith = 1
        Timer.every(0.1, function()
            startwith = startwith - 0.1
            gSounds['yellow-theme']:setVolume(startwith)
            gSounds['purple-theme']:setVolume(1 - startwith)
        end)
        :limit(10)
    else
        local startwith = 1
        Timer.every(0.1, function()
            startwith = startwith - 0.1
            gSounds['yellow-theme']:setVolume(1 - startwith)
            gSounds['purple-theme']:setVolume(startwith)
        end)
        :limit(10)
    end

    Timer.tween(1, {
        [self] = {cameraX = shiftX, cameraY = shiftY},
        -- [self.currentSide] = {baseX = -shiftX}
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

    self:evaluateStartTurn()
end

function PlayState:endCurrentTurn()
    self:evaluateEndTurn()
end


function PlayState:evaluateStartTurn()
    if not self:checkResource({resourceTable = ZERO_RESOURCES}) then
        self:gameOver()
    end
end

function PlayState:evaluateEndTurn()
    if self.currentTurn >= MAX_TURN then
        self:gameOver()
    end
end

function PlayState:gameOver()
    gSounds['yellow-theme']:stop()
    gSounds['purple-theme']:stop()
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

function PlayState:winGame(params)

    gSounds['yellow-theme']:stop()
    gSounds['purple-theme']:stop()

    if params.side == 'yellow' then
        winGameState = YellowEndingState()
    elseif params.side == 'purple' then
        winGameState = PurpleEndingState()
    end

    gStateStack:push(FadeInState({
        r = 255, g = 255, b = 255
    }, 1,
    function()
        gStateStack:pop()

        gStateStack:push(winGameState)
        gStateStack:push(FadeOutState({
            r = 255, g = 255, b = 255
        }, 1,
        function() end))
    end))
end
