Textbox = Class{}

function Textbox:init(x, y, width, height, text, wrap, font, type, colour, spacing, linenum)
    self.panel = Panel(x, y, width, height, colour)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.wrap = wrap
    self.spacing = spacing
    self.linenum = linenum

    self.text = text
    self.font = font or gFonts['small']
    _, self.textChunks = self.font:getWrap(self.text, self.width - self.wrap)
    self.type = type
    self.colour = colour

    self.chunkCounter = 1
    self.endOfText = false
    self.closed = false

    self:next()
end

--[[
    Goes to the next page of text if there is any, otherwise toggles the textbox.
]]
function Textbox:nextChunks()
    local chunks = {}

    if self.type == 'info' then
        return self.textChunks
    end

    for i = self.chunkCounter, self.chunkCounter + self.linenum - 1 do
        table.insert(chunks, self.textChunks[i])

        -- if we've reached the number of total chunks, we can return
        if i == #self.textChunks then
            self.endOfText = true
            return chunks
        end
    end

    self.chunkCounter = self.chunkCounter + self.linenum

    return chunks
end

function Textbox:next()
    if self.endOfText then
        self.displayingChunks = {}
        self.panel:toggle()
        self.closed = true
    else
        self.displayingChunks = self:nextChunks()
    end
end

function Textbox:update(dt, params)

    if self.type == 'dialogue' and (love.keyboard.wasPressed('space') or love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return')) or love.mouse.wasPressed(1) then
        gSounds['blip']:stop()
        gSounds['blip']:play()
        self:next()
    end

    if self.type == 'info' then
        self.text = params.text
        _, self.textChunks = self.font:getWrap(self.text, self.width - self.wrap)
        self.displayingChunks = self:nextChunks()
    end

end

function Textbox:isClosed()
    return self.closed
end

function Textbox:render()
    self.panel:render()

    if self.type == 'dialogue' then
        love.graphics.setFont(self.font)
        for i = 1, #self.displayingChunks do
                love.graphics.print(self.displayingChunks[i], self.x + 5, self.y + 5 + (i - 1) * self.spacing)
        end
    end

    if self.type == 'info' then
        love.graphics.setFont(self.font)
        for i = 1, #self.displayingChunks do
                love.graphics.print(self.displayingChunks[i], self.x + 5, self.y + 5 + (i - 1) * self.spacing)
        end
    end
end
