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

    self.trust = 80
    self.resources = INITIAL_RESOURCES
    self.currentTurn = 1

    self.displayPanel = DisplayPanel {
        side = self.name,
        baseX = self.baseX,
        currentTurn = self.currentTurn,
        trust = self.trust,
        resources = self.resources
    }

    -- self.test = def.entities[1].x
    for i = 1, #def.entities do
        table.insert(self.entities, Entity(def.entities[i]))
        self.entities[i].stateMachine = StateMachine {
            ['walk'] = function() return EntityWalkState(self.entities[i], self) end,
            ['idle'] = function() return EntityIdleState(self.entities[i]) end
        }
        self.entities[i]:changeState('idle')
    end

    for i = 1, 6 do
        table.insert(self.facilities, Facility(def.facilities[i]))
    end

    Event.on('trust-management', function(params)
        self:modifyTrust(params)
    end)

    self.showingResourceChange = false
    self.showingTrustChange = false


    self.shiftSideButton = Button({
        side = self.name,
        type = 'triangle',
        x = self.baseX + (self.name == 'yellow' and VIRTUAL_WIDTH - 20 or 5),
        y = VIRTUAL_HEIGHT / 2 - 15,
        width = 15,
        height = 50,
        bgcolour = self.uiBgColour,
        textcolour = self.uiTextColour,
        font = gFonts['small'],
        text = (self.name == 'yellow' and 'D' or 'A'),
        onSelect = function()
            if self.name == 'yellow' then
                Event.dispatch('shift-right')
            elseif self.name == 'purple' then
                Event.dispatch('shift-left')
            end
        end
    })

    self.endTurnButton = Button({
        type = 'rectangle',
        x = self.baseX + VIRTUAL_WIDTH / 2 - 20,
        y = VIRTUAL_HEIGHT - 30,
        width = 40,
        height = 20,
        bgcolour = self.uiBgColour,
        textcolour = self.uiTextColour,
        font = gFonts['small'],
        text = 'Next',
        onSelect = function()
            Event.dispatch('next-turn')
        end
    })

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

function Side:update(dt, params)
    -- self.currentAnimation:update(dt)
    -- self.stateMachine:update(dt)

    self.resources = params.resources
    self.currentTurn = params.currentTurn

    self.displayPanel:update(dt, {
        baseX = self.baseX,
        currentTurn = self.currentTurn,
        trust = self.trust,
        resources = self.resources,
        showingTrustChange = self.showingTrustChange,
        showingResourceChange = self.showingResourceChange,
        trustChange = self.trustChange,
        resourceChange = self.resourceChange
    })

    for k, entity in pairs(self.entities) do
        entity:update(dt)
    end

    self:facilitiesPanelsHandle(params.shifting)
    for k, facility in pairs(self.facilities) do
        facility:update(dt, params)
    end

    self.endTurnButton.x = self.baseX + VIRTUAL_WIDTH / 2 - 20
    self.endTurnButton:update(dt)
    self.shiftSideButton.x = self.baseX + (self.name == 'yellow' and VIRTUAL_WIDTH - 20 or 5)
    self.shiftSideButton:update(dt)
end

function Side:render()
    -- self.stateMachine:render()
    love.graphics.draw(self.background, self.baseX + (self.name == 'purple' and - 100 or 0))
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

    self.displayPanel:render()
    self.endTurnButton:render()
    self.shiftSideButton:render()

    love.graphics.setColor(rgb(255, 255, 255))
end

function Side:facilitiesPanelsHandle(shifting)

    if shifting then
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
            if love.mouse.wasPressed(1) then
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
    self.resourceOpacity = 1
    self.resourceChange = params.resourceTable

    Timer.after(3, function()
        Timer.tween(1, {
            [self] = {resourceOpacity = 0}
        }):finish(function()
            self.showingResourceChange = false
        end)
    end)

end

function Side:showTrustChange(params)
    if params.trust == 0 then
        return
    end
    self.showingTrustChange = true
    self.trustOpacity = 1
    self.trustChange = params.trust

    Timer.after(2, function()
        Timer.tween(1, {
            [self] = {trustOpacity = 0}
        }):finish(function()
            self.showingTrustChange = false
        end)
    end)
end
