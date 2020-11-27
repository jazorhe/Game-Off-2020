Side = Class{}

function Side:init(def)
    self.name = def.name
    self.background = def.background
    self.facilities = {}
    self.entities = {}
    self.baseX = def.baseX

    self.colour = gColours[self.name].main
    self.bg = gColours[self.name].bg
    self.uiBgColour = gColours[self.name].ui_bg
    self.uiTextColour = gColours[self.name].ui_text
    self.darkcolour = gColours[self.name].dark

    self.trust = 70
    self.resources = INITIAL_RESOURCES
    self.currentTurn = 1

    for i = 1, #def.entities do
        table.insert(self.entities, Entity(def.entities[i]))
        self.entities[i].stateMachine = StateMachine {['idle'] = function() return EntityIdleState(self.entities[i]) end}
        self.entities[i]:changeState('idle')
    end

    for i = 1, 6 do
        table.insert(self.facilities, Facility(def.facilities[i]))
    end

    self.sky = Sky({
        baseX = self.baseX,
        side = self.name,
        starColour = self.colour
    })

    self.displayPanel = DisplayPanel {
        side = self.name,
        baseX = self.baseX,
        currentTurn = self.currentTurn,
        trust = self.trust,
        resources = self.resources
    }

    self.shiftSideButton = Button({
        side = self.name,
        type = 'triangle',
        x = self.baseX + (self.name == 'yellow' and VIRTUAL_WIDTH - 20 or 5),
        y = VIRTUAL_HEIGHT / 2 - 10,
        width = 20,
        height = 50,
        bgcolour = self.uiBgColour,
        textcolour = self.uiTextColour,
        font = gFonts['small'],
        text = (self.name == 'yellow' and 'D' or 'A'),
        onSelect = function()
            gSounds['blip']:stop()
            gSounds['blip']:play()
            if self.name == 'yellow' then
                Event.dispatch('shift-right')
            elseif self.name == 'purple' then
                Event.dispatch('shift-left')
            end
        end
    })

    self.endTurnButton = Button({
        type = 'rectangle',
        x = self.baseX + VIRTUAL_WIDTH / 2 - 30,
        y = VIRTUAL_HEIGHT - 30,
        width = 60,
        height = 20,
        bgcolour = self.uiBgColour,
        textcolour = self.uiTextColour,
        font = gFonts['small'],
        text = 'End Month',
        onSelect = function()
            Event.dispatch('next-turn')
        end
    })

    self.showingResourceChange = false
    self.showingTrustChange = false

    Event.on('trust-management', function(params)
        self:modifyTrust(params)
    end)

    Event.on('win-ready', function(params)
        self.win = params.side
        self.flashButton = true
        self.falshButtonTimer = Timer.every(0.6, function()
            self.flashButton = not self.flashButton
        end)
    end)

    Event.on('win-game', function(params)
        self.flashButton = false
        self.falshButtonTimer:remove()
    end)
end

function Side:update(dt, params)
    self.resources = params.resources
    self.currentTurn = params.currentTurn == 0 and 1 or params.currentTurn
    self.regTotal = params.regTotal
    self.shifting = params.shifting

    self.sky.baseX = self.baseX
    self.endTurnButton.x = self.baseX + VIRTUAL_WIDTH / 2 - 30
    self.shiftSideButton.x = self.baseX + (self.name == 'yellow' and VIRTUAL_WIDTH - 20 or 5)

    self.displayPanel:update(dt, {
        baseX = self.baseX,
        currentTurn = self.currentTurn,
        trust = self.trust,
        resources = self.resources,
        regTotal = self.regTotal,
        showingTrustChange = self.showingTrustChange,
        showingResourceChange = self.showingResourceChange,
        trustChange = self.trustChange,
        resourceChange = self.resourceChange
    })

    for k, entity in pairs(self.entities) do
        entity:update(dt)
    end

    self.upgrading = false
    for k, facility in pairs(self.facilities) do
        facility:update(dt, params)
        if facility.displayUpgradeConfirm then
            self.upgrading = true
        end
    end
    self:facilitiesPanelsHandle()

    self.sky:update(dt)
    self.endTurnButton:update(dt)
    self.shiftSideButton:update(dt)
end

function Side:render()
    -- self.stateMachine:render()
    love.graphics.draw(self.background, self.baseX + (self.name == 'purple' and - 100 or 0))
    self.sky:render()
    love.graphics.setColor(0, 0, 0, 0.2)
    love.graphics.rectangle('fill', self.baseX, 0, VIRTUAL_WIDTH + 200, VIRTUAL_HEIGHT)
    love.graphics.setColor(WHITE)

    for k, entity in pairs(self.entities) do
        entity:render(self.baseX)
    end

    table.sort(self.facilities, function (k1, k2) return k1.renderLayer > k2.renderLayer end )
    for k, facility in pairs(self.facilities) do
        facility:render(self.baseX)
    end

    if DEBUG and DEBUG_FACILITY then
        love.graphics.printf(tostring(#self.facilities), 5, 5, VIRTUAL_WIDTH, 'left')
    end

    self.displayPanel:render()
    self.endTurnButton:render()
    self.shiftSideButton:render()

    if self.win and self.flashButton then
        love.graphics.setColor(WHITE)
        love.graphics.setLineWidth(2)
        love.graphics.rectangle('line', self.endTurnButton.x - 3, self.endTurnButton.y - 3, self.endTurnButton.width + 6, self.endTurnButton.height + 6)
    end

    love.graphics.setLineWidth(1)
    love.graphics.setColor(WHITE)
end

function Side:facilitiesPanelsHandle()

    if self.shifting then
        return
    end

    local singleHover = nil
    local canHover = true
    for k, facility in pairs(self.facilities) do
        if facility.displayUpgradeConfirm then
            singleHover = k
            canHover = false
        end
    end

    for k, facility in pairs(self.facilities) do
        if facility:isHovered() and canHover then
            facility:showInfoPanel()
            if love.mouse.wasPressed(1) and facility.currentLevel < 3 then
                facility:toggleUpgradePanel()
            end
        else
            facility.displayInfo = false
            if love.mouse.wasPressed(1) then
                facility.displayUpgradeConfirm = false
            end
        end
    end

end

function Side:checkTrust(params)
    if self.trust < 0 then
        return false
    end
    return true
end

function Side:modifyTrust(params)
    if self.name == params.side then
        self.trust = self.trust+ params.trust
        self:showTrustChange(params)
    end
end

function Side:showResourcesChange(params)
    self.showingResourceChange = true
    -- self.resourceOpacity = 1
    self.resourceChange = params.resourceTable

    if self.showResourceTimer then self.showResourceTimer:remove() end
    self.showResourceTimer = Timer.after(5, function () self.showingResourceChange = false end)
end

function Side:showTrustChange(params)
    if params.trust == 0 then
        return
    end
    self.showingTrustChange = true
    -- self.trustOpacity = 1
    self.trustChange = params.trust

    if self.showTrustTimer then self.showTrustTimer:remove() end
    self.showTrustTimer = Timer.after(5, function () self.showingTrustChange = false end)
end

function Side:createAnimations(animations)
    local animationsReturned = {}

    for k, animationDef in pairs(animations) do
        animationsReturned[k] = Animation {
            texture = animationDef.texture,
            frames = animationDef.frames,
            interval = animationDef.interval
        }
    end

    return animationsReturned
end

function Side:changeState(name, params)
    info = params or {}
    self.stateMachine:change(name, info)
end
