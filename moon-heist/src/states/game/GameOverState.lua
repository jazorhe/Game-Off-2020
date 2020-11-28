GameOverState = Class{__includes = BaseState}

function GameOverState:init()
    self.statename = 'GameOverState'
    self.allowInput = false

    self.bgopacity = 0
    self.textopacity = 0

    Timer.tween(2, {
        [self] = {bgopacity = 0.3, textopacity = 1}
    })
    :finish(function()
        self.allowInput = true
    end)

end

function GameOverState:update()
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('kpenter') or love.keyboard.wasPressed('return') or love.mouse.wasPressed(1) then
        gSounds['main-theme']:stop()
        gFuncExitToStart()
    end
end

function GameOverState:render()
    love.graphics.setColor(rgba(56, 10, 1, self.bgopacity))
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)

    love.graphics.setColor(191, 117, 117, self.textopacity)
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf('GAME OVER', 0, VIRTUAL_HEIGHT / 2 - 72, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf('Press Enter or Click anywehere to restart the Game', 0, VIRTUAL_HEIGHT / 2 + 68, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['small'])
end
