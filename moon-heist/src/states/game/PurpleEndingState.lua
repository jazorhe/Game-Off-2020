PurpleEndingState = Class{__includes = BaseState}


function PurpleEndingState:init()
    self.statename = 'PurpleEndingState'
    gSounds['main-theme']:play()
end

function PurpleEndingState:update()
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('kpenter') or love.keyboard.wasPressed('return') or love.mouse.wasPressed(1) then
        gFuncExitToStart()
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
