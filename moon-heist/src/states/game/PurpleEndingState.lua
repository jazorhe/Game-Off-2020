PurpleEndingState = Class{__includes = BaseState}


function PurpleEndingState:init()
    gSounds['main-theme']:play()
end

function PurpleEndingState:update()
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        self:startOver()
    end
end

function PurpleEndingState:render()
    love.graphics.clear(rgb(60, 4, 91))

    love.graphics.setColor(PURPLE)
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf('CONGRATS, CAPTAIN!', 0, VIRTUAL_HEIGHT / 2 - 72, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf('Press Enter to restart the Game', 0, VIRTUAL_HEIGHT / 2 + 68, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['small'])
    love.graphics.setColor(WHITE)
end

function PurpleEndingState:startOver()
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
