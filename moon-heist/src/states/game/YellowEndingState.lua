YellowEndingState = Class{__includes = BaseState}


function YellowEndingState:init()
    gSounds['main-theme']:play()
end

function YellowEndingState:update()
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') or love.mouse.wasPressed(1) then
        self:startOver()
    end
end

function YellowEndingState:render()
    love.graphics.clear(rgb(103, 98, 25))

    love.graphics.setColor(YELLOW)
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf('CONGRATS, MAYOR!', 0, VIRTUAL_HEIGHT / 2 - 72, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf('Press Enter to restart the Game', 0, VIRTUAL_HEIGHT / 2 + 68, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['small'])
    love.graphics.setColor(WHITE)
end

function YellowEndingState:startOver()
    gStateStack:push(FadeInState({
        r = 255, g = 255, b = 255
    }, 1,
    function()
        gStateStack:pop()

        gStateStack:push(StartState())
        gStateStack:push(FadeOutState({
            r = 255, g = 255, b = 255
        }, 1,
        function() end))
    end))
end
