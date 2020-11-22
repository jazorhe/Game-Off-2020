DialogueState = Class{__includes = BaseState}

function DialogueState:init(x, y, width, height, text, wrap, bgcolour, textcolour, callback)
    self.statename = 'DialogueState'
    self.textbox = Textbox(x, y, width, height, text, wrap, gFonts['small'], 'dialogue', bgcolour, textcolour, 16, 4)
    self.callback = callback or function() end
end

function DialogueState:update(dt)
    if love.keyboard.wasPressed('escape') or love.mouse.wasPressed(2) then
        gStateStack:push(PauseState())
    end

    self.textbox:update(dt)

    if self.textbox:isClosed() then
        gStateStack:pop()
        self.callback()
    end
end

function DialogueState:render()
    -- love.graphics.setColor(0, 0, 0, 0.5)
    -- love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
    self.textbox:render()
end
