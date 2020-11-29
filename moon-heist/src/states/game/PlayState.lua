 PlayState = Class{__includes = BaseState}

function PlayState:init()
    Timer.after(0.6, function()
        gSounds['yellow-theme']:setLooping(true)
        gSounds['purple-theme']:setLooping(true)
        gSounds['yellow-theme']:setVolume(1)
        gSounds['purple-theme']:setVolume(0)
        gSounds['yellow-theme']:play()
        gSounds['purple-theme']:play()
    end)

    self.statename = 'PlayState'
    self.currentTurn = 0
    self.resources = {
        ['money'] = 2000,
        ['food'] = 2000,
        ['energy'] = 2000,
        ['amenity'] = 2000
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
    self.regTotal = {
        ['money'] = 0,
        ['food'] = 0,
        ['energy'] = 0,
        ['amenity'] = 0
    }

    self.cameraX = 0
    self.cameraY = 0
    self.shifting = false
    self.allowInput = false

    self.currentEvents = {}
    self.currentEvents, self.encounterTurns = self:generateGameEvents()

    Event.on('shift-right', function(params)
        self:beginShifting(self.PurpleSide, SHIFTING_WIDTH, 0, params)
    end)

    Event.on('shift-left', function(params)
        self:beginShifting(self.yellowSide, -SHIFTING_WIDTH, 0, params)
    end)

    Event.on('resource-management', function(params)
        self:modifyResource(params)
    end)

    Event.on('win-ready', function(params)
        self.win = params.side
    end)

    Event.on('win-game', function(params)
        self:winGame(params)
    end)

    Event.on('next-turn', function(params)
        gSounds['blip']:stop()
        gSounds['blip']:play()

        if self.win then
            Event.dispatch('win-game', {side = self.win})
            return
        end

        self:endCurrentTurn()
        if self:evaluateEndTurn() then
            self:startNewTurn()
        else
        end
    end)

end

function PlayState:update(dt)
    if love.keyboard.wasPressed('escape') or love.mouse.wasPressed(2) then
        gStateStack:push(PauseState())
    end

    if not self.shifting and self.allowInput then
        if love.keyboard.wasPressed('d') and not self.shifting and self.currentSide.name == 'yellow' then
            Event.dispatch('shift-right', {})
        end

        if love.keyboard.wasPressed('a') and not self.shifting and self.currentSide.name == 'purple' then
            Event.dispatch('shift-left', {})
        end

        local upgrading = false
        for k, side in pairs(self.sides) do
            if side.upgrading then
                upgrading = true
            end
        end

        if (love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('kpenter') or love.keyboard.wasPressed('return')) and not upgrading then
            Event.dispatch('next-turn')
        end

        if self.lost then
            self:gameOver()
        end
    end

    self.regTotal = self:calculateRegTotal()
    self.currentSide:update(dt, {
        resources = self.resources,
        currentTurn = self.currentTurn,
        shifting = self.shifting,
        regTotal = self.regTotal
    })
    if self.nextSide then
        self.nextSide:update(dt, {
            resources = self.resources,
            currentTurn = self.currentTurn,
            shifting = self.shifting,
            regTotal = self.regTotal
        })
    end

    if self.newTurnTransition and not self.newTurnTransition.exited or self.shifting then

    elseif self.newTurnTransition and self.newTurnTransition.exited then
        self.newTurnTransition = nil
    else
        self:gameEventUpdateLoop(dt)
    end
end

function PlayState:render()
    love.graphics.push()

    if self.shifting then
        love.graphics.translate(-math.floor(self.cameraX), -math.floor(self.cameraY))
    end

    self.currentSide:render()
    if self.nextSide then
        self.nextSide:render()
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
        self.nextSide = nextSide
        self.shifting = true

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
    self.nextSide = nil
    self.currentSide = nextSide
    self.currentSide.baseX = 0
    self.shifting = false
end

function PlayState:checkResource(params)
    if CHEAT_MODE then
        return true
    end

    if self.resources['money'] + params.resourceTable['money'] < 0 or self.resources['food'] + params.resourceTable['food'] < 0 or self.resources['energy'] + params.resourceTable['energy'] < 0 or self.resources['amenity'] + params.resourceTable['amenity'] < 0 then
        return false
    end
    return true
end

function PlayState:modifyResource(params)
    self.resources['money'] = self.resources['money'] + params.resourceTable['money']
    self.resources['food'] = self.resources['food'] + params.resourceTable['food']
    self.resources['energy'] = self.resources['energy'] + params.resourceTable['energy']
    self.resources['amenity'] = self.resources['amenity'] + params.resourceTable['amenity']
    for k, side in pairs(self.sides) do
        side:showResourcesChange(params)
    end
end

function PlayState:calculateRegTotal()
    local regTotal = {
        ['money'] = 0,
        ['food'] = 0,
        ['energy'] = 0,
        ['amenity'] = 0
    }

    for k, side in pairs(self.sides) do
        for m, facility in pairs(side.facilities) do
            regTotal['money'] = regTotal['money'] + facility.regCost[facility.currentLevel]['money'] + facility.regEarn[facility.currentLevel]['money']

            regTotal['food'] = regTotal['food'] +
            facility.regCost[facility.currentLevel]['food'] + facility.regEarn[facility.currentLevel]['food']

            regTotal['energy'] = regTotal['energy'] + facility.regCost[facility.currentLevel]['energy'] + facility.regEarn[facility.currentLevel]['energy']

            regTotal['amenity'] = regTotal['amenity'] + facility.regCost[facility.currentLevel]['amenity'] + facility.regEarn[facility.currentLevel]['amenity']
        end
    end

    return regTotal
end

function PlayState:startNewTurn()

    self.currentTurn = self.currentTurn + 1

    if self.currentTurn ~= 1 then
        local modifyTable = self:calculateRegTotal()
        self:modifyResource({
            resourceTable = modifyTable
        })
    end


    if not self:evaluateStartTurn() then
        self.lost = true
    else
        self.newTurnTransition = NewTurnTransitionState({
            turn = self.currentTurn,
            bgcolour = self.currentSide.uiBgColour,
            textcolour = self.currentSide.uiTextColour,
            darkcolour = self.currentSide.darkcolour,
            resources = self.resources
        })

        self.allowInput = false
        gStateStack:push(self.newTurnTransition)

        if self.currentTurn >= 1 then
            Timer.after(2.5, function()
                self.allowInput = true
            end)
        end
    end
end

function PlayState:endCurrentTurn()
    self:evaluateEndTurn()
end


function PlayState:evaluateStartTurn()
    if self.currentTurn >= MAX_TURN then
        -- self:gameOver()
        gStateStack:push(TutorialState(
        TUTORIAL_DEFS[-1].dialogueParams,
        TUTORIAL_DEFS[-1].stencilParams,
        function()
            self.lost = true
            self:gameOver()
        end))
        return false
    end

    if not self:checkResource({resourceTable = ZERO_RESOURCES}) then
        -- self:gameOver()
        gStateStack:push(TutorialState(
        TUTORIAL_DEFS[-2].dialogueParams,
        TUTORIAL_DEFS[-2].stencilParams,
        function()
            self.lost = true
            self:gameOver()
        end))
        return false
    end

    for k, side in pairs(self.sides) do
        if not side:checkTrust() and side.name == 'yellow' then
            -- self:gameOver()
            gStateStack:push(TutorialState(
            TUTORIAL_DEFS[-3].dialogueParams,
            TUTORIAL_DEFS[-3].stencilParams,
            function()
                self.lost = true
                self:gameOver()
            end))
            return false
        end
    end

    return true
end

function PlayState:evaluateEndTurn()
    if self.currentTurn >= MAX_TURN then
        -- self:gameOver()
        gStateStack:push(TutorialState(
        TUTORIAL_DEFS[-1].dialogueParams,
        TUTORIAL_DEFS[-1].stencilParams,
        function()
            self.lost = true
            self:gameOver()
        end))
        return false
    end

    if not self:checkResource({resourceTable = ZERO_RESOURCES}) then
        -- self:gameOver()
        gStateStack:push(TutorialState(
        TUTORIAL_DEFS[-2].dialogueParams,
        TUTORIAL_DEFS[-2].stencilParams,
        function()
            self.lost = true
            self:gameOver()
        end))
        return false
    end

    for k, side in pairs(self.sides) do
        if not side:checkTrust() and side.name == 'yellow' then
            -- self:gameOver()
            gStateStack:push(TutorialState(
            TUTORIAL_DEFS[-3].dialogueParams,
            TUTORIAL_DEFS[-3].stencilParams,
            function()
                self.lost = true
                self:gameOver()
            end))
            return false
        end
    end

    return true
end

function PlayState:gameOver()
    if DEBUG and CHEAT_MODE then
        return
    end

    local startwith = 1
    if self.currentSide.name == 'yellow' then
        Timer.every(0.1, function()
            startwith = startwith - 0.1
            gSounds['yellow-theme']:setVolume(startwith)
        end)
        :limit(10)
    elseif self.currentSide.name == 'purple' then
        Timer.every(0.1, function()
            startwith = startwith - 0.1
            gSounds['purple-theme']:setVolume(startwith)
        end)
        :limit(10)
    end

    gStateStack:push(GameOverState())
end

function PlayState:winGame(params)

    if params.side == 'yellow' then
        local startwith = 1
        Timer.every(0.1, function()
            startwith = startwith - 0.05
            gSounds['yellow-theme']:setVolume(math.max(0, startwith))
        end):limit(20)

        if self.currentSide.name ~= params.side then
            self:shiftSide()
            Timer.after(0.65, function()
                gStateStack:push(TutorialState(
                TUTORIAL_DEFS[99].dialogueParams,
                TUTORIAL_DEFS[99].stencilParams,
                function()
                    winGameState = YellowEndingState()
                    gStateStack:push(winGameState)
                end))
            end)
        else
            gStateStack:push(TutorialState(
            TUTORIAL_DEFS[99].dialogueParams,
            TUTORIAL_DEFS[99].stencilParams,
            function()
                winGameState = YellowEndingState()
                gStateStack:push(winGameState)
            end))
        end
    elseif params.side == 'purple' then
        local startwith = 1
        Timer.every(0.1, function()
            startwith = startwith - 0.05
            gSounds['yellow-theme']:setVolume(math.max(0, startwith))
        end):limit(20)

        if self.currentSide.name ~= params.side then
            self:shiftSide()
            Timer.after(0.65, function()
                gStateStack:push(TutorialState(
                TUTORIAL_DEFS[98].dialogueParams,
                TUTORIAL_DEFS[98].stencilParams,
                function()
                    winGameState = PurpleEndingState()
                    gStateStack:push(winGameState)
                end))
            end)
        else
            gStateStack:push(TutorialState(
            TUTORIAL_DEFS[98].dialogueParams,
            TUTORIAL_DEFS[98].stencilParams,
            function()
                winGameState = PurpleEndingState()
                gStateStack:push(winGameState)
            end))
        end
    end
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

        while not randomEvent or checkEventExist(eventTable, randomEvent.eventID) or not randomEvent.inPool do
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

    if DEBUG and DEBUG_TESTEVENT then
        eventTable = {GameEvent(RANDOM_EVENTS['early'][3])}
        encounterTurns = {3}
    end

    return eventTable, encounterTurns
end

function PlayState:gameEventUpdateLoop(dt)

    if SKIP_EVENTS then
        return
    end

    if self.lost then
        self:gameOver()
        return
    end

    for k, gameEvent in pairs(self.currentEvents) do
        if gameEvent.state == 'progressing' then
            if gameEvent.resolveTurn == self.currentTurn then
                gameEvent:changeState('resolve')
            end
        end
    end

    for k, gameEvent in pairs(self.currentEvents) do
        if gameEvent.state == 'resolve' then
            if not self.shifting and gameEvent.side ~= 'general' and self.currentSide.name ~= gameEvent.side then
                self:shiftSide()
            else
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
            if not self.shifting and gameEvent.side ~= 'general' and self.currentSide.name ~= gameEvent.side then
                self:shiftSide()
            else
                gStateStack:push(GameEventDisplayState(gameEvent))
            end
        end
    end
end
