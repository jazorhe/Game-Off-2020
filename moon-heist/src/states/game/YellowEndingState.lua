YellowEndingState = Class{__includes = BaseState}


function YellowEndingState:init()
    self.statename = 'YellowEndingState'
    gSounds['main-theme']:play()
end

function YellowEndingState:update()
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('kpenter') or love.keyboard.wasPressed('return') or love.mouse.wasPressed(1) then
        gFuncExitToStart()
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
