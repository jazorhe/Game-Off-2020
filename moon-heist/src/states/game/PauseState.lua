PauseState = Class{__includes = BaseState}

function PauseState:init()

self.pauseMenu = Menu({
    x = 160,
    y = VIRTUAL_HEIGHT / 2 - 30,
    width = VIRTUAL_WIDTH - 320,
    height = 100,
    items = {
        [1] = {
            text = "Resume",
            onSelect = function() gStateStack:pop() end
        },
        [2] = {
            text = "Exit to Start Screen",
            onSelect = function()
                gStateStack = StateStack()
                gSounds['yellow-theme']:stop()
                gSounds['purple-theme']:stop()
                gStateStack:push(FadeInState({
                    r = 255, g = 255, b = 255
                }, 1,
                function()
                    gStateStack:push(StartState())
                    gStateStack:push(FadeOutState({
                        r = 255, g = 255, b = 255
                    }, 1,
                    function() end))
                end))
            end
        },
        [3] = {
            text = "Exit Game",
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
    love.graphics.setFont(gFonts['medium'])
    love.graphics.setColor(gColours['general'].ui_text)
    love.graphics.printf('Game Paused', 0, 50, VIRTUAL_WIDTH, 'center')
    self.pauseMenu:render()
end
