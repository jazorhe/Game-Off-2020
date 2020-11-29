DisplayPanel = Class{}

function DisplayPanel:init(def)
    -- self.x = def.x
    -- self.y = def.y
    self.side = def.side
    self.baseX = def.baseX
    self.currentTurn = def.currentTurn
    self.trust = def.trust
    self.resources = def.resources
    self.colourTable = gColours[self.side]
    self.regTotal = {
        ['money'] = 0,
        ['food'] = 0,
        ['energy'] = 0,
        ['amenity'] = 0
    }

    self.logo = def.logo
    self.panel = Panel ((self.side == 'yellow' and self.baseX + 10 or self.baseX + VIRTUAL_WIDTH - 150), 20, 140, VIRTUAL_HEIGHT - 40, self.colourTable.ui_bg)
end

function DisplayPanel:update(dt, params)
    self.baseX = params.baseX
    self.currentTurn = params.currentTurn

    self.trust = params.trust
    self.resources = params.resources
    self.regTotal = params.regTotal

    self.showingTrustChange = params.showingTrustChange
    self.showingResourceChange = params.showingResourceChange
    self.trustChange = params.trustChange
    self.resourceChange = params.resourceChange

    self.panel.x = (self.side == 'yellow' and self.baseX + 10 or self.baseX + VIRTUAL_WIDTH - 150)
    self.panel:update(dt)
end

function DisplayPanel:render()

    self.panel:render()

    love.graphics.setColor(WHITE)
    local logoOffX = 0
    local logoOffY = 90
    if self.side == 'yellow' then
        logoOffX = 25
    elseif self.side == 'purple' then
        logoOffX = VIRTUAL_WIDTH - 125
    end
    love.graphics.draw(self.logo, self.baseX + logoOffX, logoOffY)

    love.graphics.setColor(self.colourTable.ui_text)
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
        self.baseX + offsetX, VIRTUAL_HEIGHT - bottomY - 11 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)

    love.graphics.setFont(gFonts['small'])
    love.graphics.printf('Trust: ' .. tostring(self.trust) .. " %",
        self.baseX + offsetX, VIRTUAL_HEIGHT - bottomY - 9 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)

    love.graphics.printf('Money: ' .. tostring(self.resources['money']),
        self.baseX + offsetX, VIRTUAL_HEIGHT - bottomY - 8 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)

    love.graphics.printf('Food: ' .. tostring(self.resources['food']),
        self.baseX + offsetX, VIRTUAL_HEIGHT - bottomY - 6 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)

    love.graphics.printf('Energy: ' .. tostring(self.resources['energy']),
        self.baseX + offsetX, VIRTUAL_HEIGHT - bottomY - 4 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)

    love.graphics.printf('Amenity: ' .. tostring(self.resources['amenity']),
        self.baseX + offsetX, VIRTUAL_HEIGHT - bottomY - 2 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)

    love.graphics.setColor(self.colourTable.ui_text_light)
    love.graphics.printf('(' .. (self.regTotal['money'] == 0 and "No Change"
        or tostring(self.regTotal['money'])) .. ' next month)',
        self.baseX + offsetX, VIRTUAL_HEIGHT - bottomY - 7.2 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)
    love.graphics.printf('(' .. (self.regTotal['food'] == 0 and "No Change"
        or tostring(self.regTotal['food'])) .. ' next month)',
        self.baseX + offsetX, VIRTUAL_HEIGHT - bottomY - 5.2 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)
    love.graphics.printf('(' .. (self.regTotal['energy'] == 0 and "No Change"
        or tostring(self.regTotal['energy'])) .. ' next month)',
        self.baseX + offsetX, VIRTUAL_HEIGHT - bottomY - 3.2 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)
    love.graphics.printf('(' .. (self.regTotal['amenity'] == 0 and "No Change"
        or tostring(self.regTotal['amenity'])) .. ' next month)',
        self.baseX + offsetX, VIRTUAL_HEIGHT - bottomY - 1.2 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)

    local changeoffsetX = 84
    if self.side == 'yellow' then
        changeoffsetX = 84
    elseif self.side == 'purple' then
        changeoffsetX = -84
    end

    if self.showingTrustChange then
        love.graphics.setColor((self.trustChange >= 0 and GREEN or RED))
        love.graphics.printf(tostring((self.trustChange > 0 and "+" or "")) ..
            tostring((self.trustChange == 0 and " " or self.trustChange)).. " %",
            self.baseX + offsetX + changeoffsetX, VIRTUAL_HEIGHT - bottomY - 9 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)

        love.graphics.setColor(WHITE)
    end

    if self.showingResourceChange then
        love.graphics.setColor((self.resourceChange['money'] >= 0 and GREEN or RED))
        love.graphics.printf(tostring((self.resourceChange['money'] > 0 and "+" or "")) ..
            tostring((self.resourceChange['money'] == 0 and " " or self.resourceChange['money'])),
            self.baseX + offsetX + changeoffsetX, VIRTUAL_HEIGHT - bottomY - 8 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)

        love.graphics.setColor((self.resourceChange['food'] >= 0 and GREEN or RED))
        love.graphics.printf(tostring((self.resourceChange['food'] > 0 and "+" or "")) ..
            tostring((self.resourceChange['food'] == 0 and " " or self.resourceChange['food'])),
            self.baseX + offsetX + changeoffsetX, VIRTUAL_HEIGHT - bottomY - 6 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)

        love.graphics.setColor((self.resourceChange['energy'] >= 0 and GREEN or RED))
        love.graphics.printf(tostring((self.resourceChange['energy'] > 0 and "+" or "")) ..
            tostring((self.resourceChange['energy'] == 0 and " " or self.resourceChange['energy'])),
            self.baseX + offsetX + changeoffsetX, VIRTUAL_HEIGHT - bottomY - 4 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)

        love.graphics.setColor((self.resourceChange['amenity'] >= 0 and GREEN or RED))
        love.graphics.printf(tostring((self.resourceChange['amenity'] > 0 and "+" or "")) ..
            tostring((self.resourceChange['amenity'] == 0 and " " or self.resourceChange['amenity'])),
            self.baseX + offsetX + changeoffsetX, VIRTUAL_HEIGHT - bottomY - 2 * paddingY, self.baseX + VIRTUAL_WIDTH, alignment)
    end

    love.graphics.setColor(rgb(255, 255, 255))
end
