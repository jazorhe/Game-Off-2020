TutorialState = Class{__includes = BaseState}

function TutorialState:init(dialogueParams, stencilParams, callback)
    self.statename = 'TutorialState'
    self.dialogue = DialogueState(
    dialogueParams.x,
    dialogueParams.y,
    dialogueParams.width,
    dialogueParams.height,
    dialogueParams.text,
    dialogueParams.wrap,
    dialogueParams.bgcolour,
    dialogueParams.textcolour,
    dialogueParams.callback
    )
    self.displayDialogue = false

    self.x = stencilParams.x
    self.y = stencilParams.y
    self.width = stencilParams.width
    self.height = stencilParams.height
    self.callback = callback or function() end

    self.tutuorialBoxStencil = function()
        love.graphics.rectangle('fill', self.x, self.y, self.width, self.height, 2)
    end
end

function TutorialState:update(dt)
    if not self.displayDialogue then
        gStateStack:push(self.dialogue)
        self.displayDialogue = true
    end

    if self.dialogue.textbox:isClosed() then
        gStateStack:pop()
        self.callback()
    end
end

function TutorialState:render()
    love.graphics.stencil(self.tutuorialBoxStencil, "replace", 1)
    love.graphics.setStencilTest('less', 1)
    love.graphics.setColor(0, 0, 0, 0.5)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
    love.graphics.setStencilTest()
    love.graphics.setColor(WHITE)
end
