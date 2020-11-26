Selection = Class{}

function Selection:init(def)
    self.items = def.items
    self.x = def.x
    self.y = def.y

    self.height = def.height
    self.width = def.width
    self.font = def.font or gFonts['small']
    self.textcolour = def.textcolour

    self.gapHeight = self.height / #self.items

    self.currentSelection = 1
end

function Selection:update(dt, gameEvent, callback)
    if love.keyboard.wasPressed('return') or love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('kpenter') then
        self:selectionEvent(gameEvent, callback)
    end

    if love.keyboard.wasPressed('up') then
        if self.currentSelection == 1 then
            self.currentSelection = #self.items
        else
            self.currentSelection = self.currentSelection - 1
        end
        gSounds['blip']:stop()
        gSounds['blip']:play()

    elseif love.keyboard.wasPressed('down') then
        if self.currentSelection == #self.items then
            self.currentSelection = 1
        else
            self.currentSelection = self.currentSelection + 1
        end
        gSounds['blip']:stop()
        gSounds['blip']:play()

    elseif mouseX > self.x and mouseX < self.x + self.width and mouseY > self.y and mouseY < self.y + self.height then

        if love.mouse.wasPressed(1) then
            self:selectionEvent(gameEvent, callback)
        end

        for k, item in pairs(self.items) do
            if mouseY > self.y + (self.height / #self.items) * (k - 1) and mouseY < self.y + (self.height / #self.items) * (k) and mouseMoved then

                if self.currentSelection ~= k then
                    gSounds['blip']:stop()
                    gSounds['blip']:play()
                    self.currentSelection = k
                end
            end
        end
    end
end

function Selection:render()
    local currentY = self.y

    for i = 1, #self.items do
        love.graphics.setColor(self.textcolour)
        love.graphics.setFont(gFonts['small'])

        local paddedY = currentY + (self.gapHeight / 2) - self.font:getHeight() / 2

        -- draw selection marker if we're at the right index
        if i == self.currentSelection then
            love.graphics.draw(gTextures['cursor'], self.x - 15, paddedY - self.font:getHeight() / 2)
        end

        love.graphics.printf(self.items[i].text, self.x + 8, paddedY, self.width - 13, 'left')

        currentY = currentY + self.gapHeight
    end

    love.graphics.setColor(WHITE)
end

function Selection:selectionEvent(gameEvent, callback)
    self.items[self.currentSelection].onSelect()
    gSounds['blip']:stop()
    gSounds['blip']:play()
    if gameEvent then
        callback(self.currentSelection)
    end
end
