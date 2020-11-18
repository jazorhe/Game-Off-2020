DialogueState = Class{__includes = BaseState}

function DialogueState:init(x, y, width, height, text, wrap, bgcolour, textcolour, callback)
    self.textbox = Textbox(x, y, width, height, text, wrap, gFonts['small'], 'dialogue', bgcolour, textcolour, 16, 3)
    self.callback = callback or function() end
end

function DialogueState:update(dt)
    self.textbox:update(dt)

    if self.textbox:isClosed() then
        gStateStack:pop()
        self.callback()
    end
end

function DialogueState:render()
    self.textbox:render()
end
