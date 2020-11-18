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
        background = gTextures['yellowbg'],
        entities = ENTITY_DEFS['yellow'],
        facilities = FACILITY_DEFS['yellow'],
        baseX = 0
    })

    self.PurpleSide = Side({
        name = 'purple',
        colour = PURPLE,
        background = gTextures['purplebg'],
        entities = ENTITY_DEFS['purple'],
        facilities = FACILITY_DEFS['purple'],
        baseX = SHIFTING_WIDTH
    })


    self.sides = {self.yellowSide, self.PurpleSide}
    self.currentSide = self.yellowSide

    self.cameraX = 0
    self.cameraY = 0
    self.shifting = false

    self.currentEvents = {}

    if EVENTS_MODE then
        self.currentEvents, self.encounterTurns = self:generateGameEvents()
    end

    -- self:startNewTurn()

    Event.on('shift-right', function(params)
        self:beginShifting(self.PurpleSide, SHIFTING_WIDTH, 0, params)
    end)

    Event.on('shift-left', function(params)
        self:beginShifting(self.yellowSide, -SHIFTING_WIDTH, 0, params)
    end)

    Event.on('resource-management', function(params)
        self:modifyResource(params)
    end)

    Event.on('win-game', function(params)
        self:winGame(params)
    end)

    Event.on('next-turn', function(params)
        gSounds['blip']:stop()
        gSounds['blip']:play()
        self:endCurrentTurn()
        self:startNewTurn()
    end)

end

function PlayState:update(dt)

    if love.keyboard.wasPressed('escape') or love.mouse.wasPressed(2) then
        gStateStack:push(PauseState())
    end

    if not self.shifting then
        if self.lost then
            self:gameOver()
        end

        self:gameEventUpdateLoop(dt)

        if love.keyboard.wasPressed('d') and not self.shifting and self.currentSide.name == 'yellow' then
            Event.dispatch('shift-right', {})
        end

        if love.keyboard.wasPressed('a') and not self.shifting and self.currentSide.name == 'purple' then
            Event.dispatch('shift-left', {})
        end

        if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
            Event.dispatch('next-turn')
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
    love.graphics.setColor(rgb(255, 255, 255))

    if DEBUG and DEBUG_EVENTS then
        love.graphics.setFont(gFonts['medium'])
        love.graphics.setColor(WHITE)
        love.graphics.print("Turns: ", 5, 5)
        for k, turn in pairs(self.encounterTurns) do
            love.graphics.print(tostring(turn), 42 + k * 20, 5)
        end
        local nextEventTurn = 0
        for k, event in pairs(self.currentEvents) do
            love.graphics.print("EventID:" .. tostring(self.currentEvents[k].eventID), 5, 5 + k * 20)
        end
        love.graphics.setFont(gFonts['small'])
    end
end

function PlayState:shiftSide()
    if self.currentSide.name == 'yellow' then
        self:beginShifting(self.PurpleSide, VIRTUAL_WIDTH, 0, params)
    elseif self.currentSide.name == 'purple' then
        self:beginShifting(self.yellowSide, -VIRTUAL_WIDTH, 0, params)
    end
end


function PlayState:beginShifting(nextSide, shiftX, shiftY, params)
    if not self.shifting then
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

        Timer.tween(0.6, {
            [self] = {cameraX = shiftX, cameraY = shiftY},
            -- [self.currentSide] = {baseX = -shiftX}
        }):finish(function()
            self.currentSide.baseX = -shiftX
            self:finishShifting(nextSide)
        end)
    end
end

function PlayState:finishShifting(nextSide)
    self.cameraX = 0
    self.cameraY = 0
    self.nextSide = self.currentSide
    self.nextSide.baseX = self.nextSide.name == 'yellow' and - SHIFTING_WIDTH or SHIFTING_WIDTH
    self.currentSide = nextSide
    self.currentSide.baseX = 0
    self.shifting = false
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
    for k, side in pairs(self.sides) do
        side:showResourcesChange(params)
    end
end

function PlayState:startNewTurn()

    self.currentTurn = self.currentTurn + 1

    local modifyTable = {
        ['money'] = 0,
        ['food'] = 0,
        ['energy'] = 0,
        ['perception'] = 0
    }

    if self.currentTurn ~= 1 then
        for k, side in pairs(self.sides) do
            for m, facility in pairs(side.facilities) do
                modifyTable['money'] = modifyTable['money'] + facility.regCost[facility.currentLevel]['money'] + facility.regEarn[facility.currentLevel]['money']

                modifyTable['food'] = modifyTable['food'] +
                facility.regCost[facility.currentLevel]['food'] + facility.regEarn[facility.currentLevel]['food']

                modifyTable['energy'] = modifyTable['energy'] + facility.regCost[facility.currentLevel]['energy'] + facility.regEarn[facility.currentLevel]['energy']

                modifyTable['perception'] = modifyTable['perception'] + facility.regCost[facility.currentLevel]['perception'] + facility.regEarn[facility.currentLevel]['perception']
            end
        end
        self:modifyResource({
            resourceTable = modifyTable
        })
    end

    gStateStack:push(NewTurnTransitionState({
        turn = self.currentTurn,
        bgcolour = self.currentSide.uiBgColour,
        textcolour = self.currentSide.uiTextColour,
        darkcolour = self.currentSide.darkcolour
    }))

    if not self:evaluateStartTurn() then
        self.lost = true
    end
end

function PlayState:endCurrentTurn()
    self:evaluateEndTurn()
end


function PlayState:evaluateStartTurn()
    if not self:checkResource({resourceTable = ZERO_RESOURCES}) then
        return false
    end
    return true
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

function PlayState:generateGameEvents()
    -- table.insert(self.currentEvents, GameEvent(RANDOM_EVENTS['early'][1]))
    local seperation = 9
    local encounterTurns = {3}
    local i = 3
    while i < seperation and seperation - i > 4 do
        i = i + math.random(2, 4)
        table.insert(encounterTurns, i)
    end
    table.insert(encounterTurns, seperation)
    i = seperation
    while i < 16 and 16 - i > 4 do
        i = i + math.random(2, 4)
        table.insert(encounterTurns, i)
    end
    table.insert(encounterTurns, 16)
    i = 16

    local n = 1
    local attempCount = 0
    local randomEvent = nil
    local eventTable = {}

    local function checkEventExist (events, eventID)
        for k, event in pairs(events) do
            if event.eventID == eventID then return true end
        end
        return false
    end

    while n <= #encounterTurns do
        local eventGroup = encounterTurns[n] <= seperation and 'early' or 'later'

        while not randomEvent or checkEventExist(eventTable, randomEvent.eventID) do
            randomEvent = RANDOM_EVENTS[eventGroup][math.random(#RANDOM_EVENTS[eventGroup])]
            attempCount = attempCount + 1
            if attempCount > 10 then break end
        end

        if randomEvent then
            randomEvent.encounter = encounterTurns[n]
            randomEvent.resolve = encounterTurns[n]
            table.insert(eventTable, GameEvent(randomEvent))
            randomEvent = nil
        end
        n = n + 1
    end

    return eventTable, encounterTurns
end

function PlayState:gameEventUpdateLoop(dt)
    for k, gameEvent in pairs(self.currentEvents) do
        if gameEvent.state == 'progressing' then
            if gameEvent.resolveTurn == self.currentTurn then
                gameEvent:changeState('resolve')
            end
        end
    end

    for k, gameEvent in pairs(self.currentEvents) do
        if gameEvent.state == 'resolve' then
            if gameEvent.side ~= 'general' and self.currentSide.name ~= gameEvent.side then
                self:shiftSide()
            end
            if not self.shifting and self.currentSide.baseX == 0 then
                gStateStack:push(GameEventDisplayState(gameEvent))
            end
        end
    end

    for k, gameEvent in pairs(self.currentEvents) do
        if gameEvent.state == 'planned' then
            if gameEvent.encounterTurn == self.currentTurn then
                gameEvent:changeState('encounter')
            end
        end
    end

    for k, gameEvent in pairs(self.currentEvents) do
        if gameEvent.state == 'encounter' then
            if gameEvent.side ~= 'general' and self.currentSide.name ~= gameEvent.side then
                self:shiftSide()
            end
            if not self.shifting and self.currentSide.baseX == 0 then
                gStateStack:push(GameEventDisplayState(gameEvent))
            end
        end
    end
end
