PurpleEndingState = Class{__includes = BaseState}


function PurpleEndingState:init()
    self.statename = 'PurpleEndingState'
    self.allowInput = false

    self.bgopacity = 0
    self.textopacity = 0

    Timer.tween(2, {
        [self] = {bgopacity = 0.6, textopacity = 1}
    })
    :finish(function()
        self.allowInput = true
    end)

    gSounds['main-theme']:stop()
    Timer.after(1.2, function()
        gSounds['main-theme']:play()
        gSounds['main-theme']:setVolume(0)
    end)

    local startwith = 1
    Timer.every(0.1, function()
        startwith = startwith - 0.1
        gSounds['purple-theme']:setVolume(math.max(0, startwith))
        gSounds['main-theme']:setVolume(math.min(1, 0 - startwith))
    end)
    :limit(20)
end

function PurpleEndingState:update()
    if self.allowInput and (love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('kpenter') or love.keyboard.wasPressed('return') or love.mouse.wasPressed(1)) then
        gFuncExitToStart()
    end
end

function PurpleEndingState:render()
    love.graphics.setColor(rgba(55, 17, 77, self.bgopacity))
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)

    local r, g, b = unpack(PURPLE)
    love.graphics.setColor(r, g, b, self.textopacity)
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf('WELCOME ON BOARD, CAPTAIN!', 0, VIRTUAL_HEIGHT / 2 - 72, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf('Press Enter or Click anywehere to restart the Game', 0, VIRTUAL_HEIGHT / 2 + 68, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['small'])
    love.graphics.setColor(WHITE)
end
