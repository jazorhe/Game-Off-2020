Selection = Class{}

function Selection:init(def)
    self.items = def.items
    self.x = def.x
    self.y = def.y

    self.height = def.height
    self.width = def.width
    self.font = def.font or gFonts['small']

    self.gapHeight = self.height / #self.items

    self.currentSelection = 1
end

function Selection:update(dt, gameEvent, callback)
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
    elseif love.keyboard.wasPressed('return') or love.keyboard.wasPressed('enter') then
        self.items[self.currentSelection].onSelect()
        gSounds['blip']:stop()
        gSounds['blip']:play()

        if gameEvent then
            callback(self.currentSelection)
        end

    end
end

function Selection:render()
    local currentY = self.y

    for i = 1, #self.items do
        love.graphics.setColor(WHITE)
        local paddedY = currentY + (self.gapHeight / 2) - self.font:getHeight() / 2

        -- draw selection marker if we're at the right index
        if i == self.currentSelection then
            -- love.graphics.setColor(PURPLE)
            love.graphics.draw(gTextures['cursor'], self.x - 8, paddedY)
        end

        love.graphics.printf(self.items[i].text, self.x + 5, paddedY, self.width, 'left')

        currentY = currentY + self.gapHeight
    end
end
