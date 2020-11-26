StartState = Class{__includes = BaseState}

function StartState:init()
    gSounds['main-theme']:play()

    self.statename = 'StartState'
    self.sprites = {'yellow', 'purple'}
    self.sprite = self.sprites[math.random(2)]

    self.frame = math.random(126)
    while self.frame % 7 ~= 1 do
        self.frame = math.random(126)
    end

    self.spriteX = math.floor(VIRTUAL_WIDTH / 2 - 24)
    self.spriteY = math.floor(VIRTUAL_HEIGHT / 2 - 36)

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
            self.spriteY = math.floor(VIRTUAL_HEIGHT / 2 - 36)

            Timer.tween(0.2, {
                [self] = {spriteX = math.floor(VIRTUAL_WIDTH / 2 - 24)}
            })
        end)
    end)

    self.startMenu = Menu({
        x = VIRTUAL_WIDTH / 2 - 60,
        y = VIRTUAL_HEIGHT / 2 + 68,
        width = 120,
        height = 80,
        items = {
            [1] = {
                text = "Start Game",
                onSelect = function() self.displayTutorialConfirmation = true end
            },
            [2] = {
                text = "Credits",
                onSelect = function() self.displayCredits = true end
            },
            [3] = {
                text = "Quit",
                onSelect = function() love.event.quit() end
            }
        },
        bgcolour = gColours['general'].ui_bg,
        textcolour = gColours['general'].ui_text
    })

    self.tutorialPrompt = Textbox(
        160, VIRTUAL_HEIGHT / 2 - 80, VIRTUAL_WIDTH - 320, 40,
        "Do you need a tutorial?",
        12, gFonts['small'], 'dialogue', gColours['general'].ui_bg, gColours['general'].ui_text, 12, 3)

    self.tutorialMenu = Menu({
        x = VIRTUAL_WIDTH / 2 - 60,
        y = VIRTUAL_HEIGHT / 2,
        width = 120,
        height = 80,
        items = {
            [1] = {
                text = "Yes",
                onSelect = function() self:startGame(true) end
            },
            [2] = {
                text = "No",
                onSelect = function() self:startGame(false) end
            },
            [3] = {
                text = "Cancel",
                onSelect = function()
                    self.tutorialMenu.selection.currentSelection = 1
                    self.displayTutorialConfirmation = false
                end
            }
        },
        bgcolour = gColours['general'].ui_bg,
        textcolour = gColours['general'].ui_text
    })
    self.displayTutorialConfirmation = false
    self.displayCredits = false
end

function StartState:update(dt)
    if self.displayTutorialConfirmation then
        -- self.tutorialPrompt:update(dt)
        self.tutorialMenu:update(dt)
    elseif self.displayCredits then
        if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') or love.keyboard.wasPressed('kpenter') or love.mouse.wasPressed(1) then
            self.displayCredits = false
        end
    else
        self.startMenu:update(dt)
    end
end

function StartState:render()
    love.graphics.push()
    love.graphics.clear(rgb(34, 2, 26))

    love.graphics.setColor(GREY)
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf('Moon Heist!', 0, VIRTUAL_HEIGHT / 2 - 96, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['small'])

    love.graphics.setColor(GREY)
    love.graphics.circle('fill', VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2, 45)

    love.graphics.setColor(WHITE)
    love.graphics.draw(gTextures[self.sprite], gFrames[self.sprite][self.frame], self.spriteX, self.spriteY)

    self.startMenu:render()

    if self.displayTutorialConfirmation then
        love.graphics.setColor(0, 0, 0, 0.8)
        love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
        love.graphics.setColor(WHITE)
        self.tutorialPrompt:render()
        self.tutorialMenu:render()
    end

    if self.displayCredits then
        love.graphics.setColor(0, 0, 0, 0.8)
        love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
        love.graphics.setColor(WHITE)
        love.graphics.setFont(gFonts['large'])
        love.graphics.printf('Credits', 0, 84, VIRTUAL_WIDTH, 'center')
        love.graphics.setFont(gFonts['medium'])
        love.graphics.printf('Art and Concepts:', 120, VIRTUAL_HEIGHT / 2 - 48, VIRTUAL_WIDTH - 240, 'left')
        love.graphics.printf('Bonan Cypress Li', 120, VIRTUAL_HEIGHT / 2 - 48, VIRTUAL_WIDTH - 240, 'right')
        love.graphics.printf('Art and Concepts:', 120, VIRTUAL_HEIGHT / 2 - 24, VIRTUAL_WIDTH - 240, 'left')
        love.graphics.printf('Honglin Rhoda Du', 120, VIRTUAL_HEIGHT / 2 - 24, VIRTUAL_WIDTH - 240, 'right')
        love.graphics.printf('Game Development:', 120, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH - 240, 'left')
        love.graphics.printf('Jiehao Jazor He', 120, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH - 240, 'right')
        love.graphics.printf('Music Composition:', 120, VIRTUAL_HEIGHT / 2 + 24, VIRTUAL_WIDTH - 240, 'left')
        love.graphics.printf('Shi Adam Chen', 120, VIRTUAL_HEIGHT / 2 + 24, VIRTUAL_WIDTH - 240, 'right')
        love.graphics.printf('Special Thanks To:', 120, VIRTUAL_HEIGHT / 2 + 48, VIRTUAL_WIDTH - 240, 'left')
        love.graphics.printf('Chuyi Olivia Deng', 120, VIRTUAL_HEIGHT / 2 + 48, VIRTUAL_WIDTH - 240, 'right')
    end

    love.graphics.pop()
end

function StartState:startGame(tutorialConfirmation)
    gStateStack:push(FadeInState({
        r = 255, g = 255, b = 255
    }, 1,
    function()
        gSounds['main-theme']:stop()
        self.tween:remove()

        gStateStack:pop()
        local play = PlayState()
        gStateStack:push(play)

        if not tutorialConfirmation then
            gStateStack:push(TutorialState(
            TUTORIAL_DEFS[0].dialogueParams,
            TUTORIAL_DEFS[0].stencilParams,
            function()
                play:startNewTurn()
            end
            ))
        else
            gStateStack:push(TutorialState(
                TUTORIAL_DEFS[1].dialogueParams,
                TUTORIAL_DEFS[1].stencilParams,
                TUTORIAL_DEFS[1].callback
            ))
        end

        gStateStack:push(FadeOutState({
            r = 255, g = 255, b = 255
        }, 1,
        function() end))
    end))
end
