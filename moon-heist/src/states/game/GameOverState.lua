GameOverState = Class{__includes = BaseState}


function GameOverState:init()
    self.statename = 'GameOverState'
    gSounds['main-theme']:play()
end

function GameOverState:update()
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('kpenter') or love.keyboard.wasPressed('return') or love.mouse.wasPressed(1) then
        gFuncExitToStart()
    end
end

function GameOverState:render()
    love.graphics.clear(rgb(102, 52, 43))

    love.graphics.setColor(rgb(190, 163, 165))
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf('GAME OVER', 0, VIRTUAL_HEIGHT / 2 - 72, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf('Press Enter to restart the Game', 0, VIRTUAL_HEIGHT / 2 + 68, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['small'])
end
