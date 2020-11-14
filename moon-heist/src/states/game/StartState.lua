StartState = Class{__includes = BaseState}

function StartState:init()
    gSounds['main-theme']:play()

    self.sprites = {'yellow', 'purple'}
    self.sprite = self.sprites[math.random(2)]

    self.frame = math.random(126)
    while self.frame % 7 ~= 1 do
        self.frame = math.random(126)
    end

    self.spriteX = VIRTUAL_WIDTH / 2 - 24
    self.spriteY = VIRTUAL_HEIGHT / 2 - 24

    self.tween = Timer.every(3, function()
        Timer.tween(0.2, {
            [self] = {spriteX = -64}
        })
        :finish(function()
            self.sprite = self.sprites[math.random(2)]
            self.frame = math.random(126)
            while self.frame % 7 ~= 1 do
                self.frame = math.random(126)
            end

            self.spriteX = VIRTUAL_WIDTH
            self.spriteY = VIRTUAL_HEIGHT / 2 - 24

            Timer.tween(0.2, {
                [self] = {spriteX = VIRTUAL_WIDTH / 2 - 24}
            })
        end)
    end)

end

function StartState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateStack:push(FadeInState({
            r = 255, g = 255, b = 255
        }, 1,
        function()
            gSounds['main-theme']:stop()
            self.tween:remove()

            gStateStack:pop()

            gStateStack:push(PlayState())
            gStateStack:push(DialogueState("" ..
                "Welcome to the world of Moon Heist! There is meant to be an introduction here but I am going to skip for now! (Press Enter to dismiss dialogues)", YELLOW_UI_BG
            ))
            gStateStack:push(FadeOutState({
                r = 255, g = 255, b = 255
            }, 1,
            function() end))
        end))
    end
end

function StartState:render()
    love.graphics.push()
    love.graphics.clear(GREY_UI_BG)

    love.graphics.setColor(GREY_UI_TEXT)
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf('Moon Heist!', 0, VIRTUAL_HEIGHT / 2 - 72, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf('Press Enter', 0, VIRTUAL_HEIGHT / 2 + 68, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['small'])

    love.graphics.setColor(GREY)
    love.graphics.circle('fill', VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2, 45)

    love.graphics.setColor(WHITE)
    love.graphics.draw(gTextures[self.sprite], gFrames[self.sprite][self.frame], self.spriteX, self.spriteY)
    love.graphics.pop()
end
