PauseState = Class{__includes = BaseState}

function PauseState:init()

self.statename = 'PauseState'
self.pauseMenu = Menu({
    x = 240,
    y = VIRTUAL_HEIGHT / 2 - 30,
    width = VIRTUAL_WIDTH - 480,
    height = 100,
    items = {
        [1] = {
            text = "Resume Game",
            onSelect = function() gStateStack:pop() end
        },
        [2] = {
            text = "Exit to Menu",
            onSelect = function()
                gFuncExitToStart()
            end
        },
        [3] = {
            text = "Quit Game",
            onSelect = function() love.event.quit() end
        }
    },
    bgcolour = gColours['general'].ui_bg,
    textcolour = gColours['general'].ui_text
})

end

function PauseState:update(dt)
    if love.keyboard.wasPressed('escape') or love.mouse.wasPressed(2) then
        gStateStack:pop()
    end
    self.pauseMenu:update(dt)
end

function PauseState:render()
    love.graphics.setColor(0, 0, 0, 0.7)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
    love.graphics.setFont(gFonts['large'])
    love.graphics.setColor(gColours['general'].ui_text)
    love.graphics.printf('Game Paused', 0, 100, VIRTUAL_WIDTH, 'center')
    self.pauseMenu:render()
end
