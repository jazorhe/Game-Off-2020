DebugOptionsState = Class{__includes = BaseState}

function DebugOptionsState:init()
self.statename = 'DebugOptionsState'
self.x = VIRTUAL_WIDTH / 2 - 80
self.y = VIRTUAL_HEIGHT / 2 - 80
self.debugOptionsMenu = Menu({
    x = self.x,
    y = self.y,
    width = 160,
    height = 160,
    items = gDebugConstants,
    bgcolour = gColours['general'].ui_bg,
    textcolour = gColours['general'].ui_text
})
self.debugOptionsMenu.selection.currentSelection = 1
end

function DebugOptionsState:update(dt)
    if love.keyboard.wasPressed('escape') or love.mouse.wasPressed(2) then
        gStateStack:pop()
    end
    self.debugOptionsMenu:update(dt)
end

function DebugOptionsState:render()
    love.graphics.setColor(0, 0, 0, 0.8)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
    love.graphics.setColor(WHITE)

    love.graphics.setFont(gFonts['large'])
    love.graphics.setColor(gColours['general'].ui_text)
    love.graphics.printf('Debug Options', 0, 50, VIRTUAL_WIDTH, 'center')

    self.debugOptionsMenu:render()

    love.graphics.setFont(gFonts['small'])
    love.graphics.setColor(WHITE)

    for k, item in pairs(self.debugOptionsMenu.selection.items) do
        love.graphics.printf(tostring(item.value), VIRTUAL_WIDTH / 2, self.y + 5 + (k - 1) * (self.debugOptionsMenu.selection.height / #self.debugOptionsMenu.selection.items), 70, 'right')
    end
end
