DisplayPanel = Class{}

function DisplayPanel:init(def)
    -- self.x = def.x
    -- self.y = def.y
    self.side = def.side
    self.baseX = def.baseX
    self.currentTurn = def.currentTurn
    self.trust = def.trust
    self.resources = def.resources
    self.colour = gColours[self.side].main
    self.bg = gColours[self.side].bg
    self.uiBgColour = gColours[self.side].ui_bg
    self.uiTextColour = gColours[self.side].ui_text

    self.panel = Panel ((self.side == 'yellow' and self.baseX + 10 or self.baseX + VIRTUAL_WIDTH - 150), 20, 140, VIRTUAL_HEIGHT - 40, self.uiBgColour)
end

function DisplayPanel:update(dt, params)
    self.baseX = params.baseX
    self.currentTurn = params.currentTurn
    self.trust = params.trust
    self.resources = params.resources
    self.showingTrustChange = params.showingTrustChange
    self.showingResourceChange = params.showingResourceChange
    self.trustChange = params.trustChange
    self.resourceChange = params.resourceChange
    self.panel:update(dt)

    self.panel.x = (self.side == 'yellow' and self.baseX + 10 or self.baseX + VIRTUAL_WIDTH - 150)
end

function DisplayPanel:render()

    self.panel:render()
    love.graphics.setColor(self.uiTextColour)

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
        self.baseX + offsetX, VIRTUAL_HEIGHT - bottomY - 7 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)


    love.graphics.setFont(gFonts['small'])
    love.graphics.printf('Trust: ' .. tostring(self.trust) .. " %",
        self.baseX + offsetX, VIRTUAL_HEIGHT - bottomY - 5 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)

    love.graphics.printf('Money: ' .. tostring(self.resources['money']),
        self.baseX + offsetX, VIRTUAL_HEIGHT - bottomY - 4 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)
    love.graphics.printf('Food: ' .. tostring(self.resources['food']),
        self.baseX + offsetX, VIRTUAL_HEIGHT - bottomY - 3 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)
    love.graphics.printf('Energy: ' .. tostring(self.resources['energy']),
        self.baseX + offsetX, VIRTUAL_HEIGHT - bottomY - 2 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)
    love.graphics.printf('Perception: ' .. tostring(self.resources['perception']),
        self.baseX + offsetX, VIRTUAL_HEIGHT - bottomY - 1 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)

    local changeoffsetX = 84
    if self.side == 'yellow' then
        changeoffsetX = 84
    elseif self.side == 'purple' then
        changeoffsetX = -84
    end

    if self.showingTrustChange then

        if self.trustChange > 0 then
            love.graphics.setColor(GREEN)
        elseif self.trustChange < 0 then
            love.graphics.setColor(RED)
        end

        love.graphics.printf(tostring(self.trustChange) .. " %",
            self.baseX + offsetX + changeoffsetX, VIRTUAL_HEIGHT - bottomY - 5 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)

        love.graphics.setColor(WHITE)
    end

    if self.showingResourceChange then

        love.graphics.setColor((self.resourceChange['money'] >= 0 and GREEN or RED))
        love.graphics.printf(tostring((self.resourceChange['money'] > 0 and "+" or "")) ..
            tostring((self.resourceChange['money'] == 0 and "" or self.resourceChange['money'])),
            self.baseX + offsetX + changeoffsetX, VIRTUAL_HEIGHT - bottomY - 4 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)

        love.graphics.setColor((self.resourceChange['food'] >= 0 and GREEN or RED))
        love.graphics.printf(tostring((self.resourceChange['food'] > 0 and "+" or "")) ..
            tostring((self.resourceChange['food'] == 0 and "" or self.resourceChange['food'])),
            self.baseX + offsetX + changeoffsetX, VIRTUAL_HEIGHT - bottomY - 3 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)

        love.graphics.setColor((self.resourceChange['energy'] >= 0 and GREEN or RED))
        love.graphics.printf(tostring((self.resourceChange['energy'] > 0 and "+" or "")) ..
            tostring((self.resourceChange['energy'] == 0 and "" or self.resourceChange['energy'])),
            self.baseX + offsetX + changeoffsetX, VIRTUAL_HEIGHT - bottomY - 2 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)

        love.graphics.setColor((self.resourceChange['perception'] >= 0 and GREEN or RED))
        love.graphics.printf(tostring((self.resourceChange['perception'] > 0 and "+" or "")) ..
            tostring((self.resourceChange['perception'] == 0 and "" or self.resourceChange['perception'])),
            self.baseX + offsetX + changeoffsetX, VIRTUAL_HEIGHT - bottomY - 1 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)

    end

    love.graphics.setColor(rgb(255, 255, 255))
end
