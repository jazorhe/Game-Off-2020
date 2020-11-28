StartState = Class{__includes = BaseState}

function StartState:init()
    Timer.after(0.6, function()
        self.themeVol = 1
        gSounds['main-theme']:setVolume(self.themeVol)
        gSounds['main-theme']:play()
        gSounds['main-theme']:setLooping(true)
    end)

    self.statename = 'StartState'
    self.sprites = {'yellow', 'purple'}
    self.sprite = self.sprites[math.random(2)]

    self.frame = math.random(105)
    while self.frame % 7 ~= 1 do
        self.frame = math.random(105)
    end
    self.lastFrame = self.frame

    self.entities = {}
    self:generateEntities()

    self.spriteX = math.floor(VIRTUAL_WIDTH / 2 - 48)
    self.spriteY = math.floor(VIRTUAL_HEIGHT / 2 - 60)

    self.tween = Timer.every(3, function()
        Timer.tween(0.2, {
            [self] = {spriteX = -64}
        })
        :finish(function()
            self.sprite = self.sprites[math.random(2)]
            self.frame = math.random(105)
            while self.frame % 7 ~= 1 or self.frame == self.lastFrame do
                self.frame = math.random(105)
            end
            self.lastFrame = self.frame

            self.spriteX = VIRTUAL_WIDTH
            self.spriteY = math.floor(VIRTUAL_HEIGHT / 2 - 60)

            Timer.tween(0.2, {
                [self] = {spriteX = math.floor(VIRTUAL_WIDTH / 2 - 48)}
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
                onSelect = function() gStateStack:push(CreditsState()) end
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
        self.tutorialMenu:update(dt)
    else
        self.startMenu:update(dt)
    end

    for k, entity in pairs(self.entities) do
        entity:update(dt)
    end
end

function StartState:render()
    love.graphics.push()
    love.graphics.clear(rgb(36, 25, 51))

    for k, entity in pairs(self.entities) do
        entity:render()
    end

    love.graphics.setColor(WHITE)
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf('Moon Heist!', 0, VIRTUAL_HEIGHT / 2 - 108, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['small'])

    -- love.graphics.setColor(GENERAL_TEXT)
    -- love.graphics.circle('fill', VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2, 45)

    love.graphics.setColor(WHITE)
    love.graphics.draw(gTextures[self.sprite], gFrames[self.sprite][self.frame], self.spriteX, self.spriteY, 0, 2, 2)

    self.startMenu:render()

    if self.displayTutorialConfirmation then
        love.graphics.setColor(0, 0, 0, 0.8)
        love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
        love.graphics.setColor(WHITE)
        self.tutorialPrompt:render()
        self.tutorialMenu:render()
    end

    love.graphics.pop()
end

function StartState:startGame(tutorialConfirmation)
    gStateStack:push(FadeInState({
        r = 255, g = 255, b = 255
    }, 1,
    function()
        Timer.every(0.1, function()
            self.themeVol = math.max(0, self.themeVol - 0.1)
            gSounds['main-theme']:setVolume(self.themeVol)
        end):limit(15)

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

function StartState:generateEntities()
    table.insert(self.entities, Entity(ENTITY_DEFS['yellow'][1]))
    self.entities[1].stateMachine = StateMachine {['idle'] = function() return EntityIdleState(self.entities[1]) end}
    self.entities[1]:changeState('idle')

    table.insert(self.entities, Entity(ENTITY_DEFS['purple'][1]))
    self.entities[2].stateMachine = StateMachine {['idle'] = function() return EntityIdleState(self.entities[2]) end}
    self.entities[2]:changeState('idle')

    for k, entity in pairs(self.entities) do
        entity.stateMachine = StateMachine {['idle'] = function() return EntityIdleState(entity) end}
        entity:changeState('idle')

        if k == 1 then
            entity.scale = 2
            entity.x = - entity.width
            entity.y = 60
        elseif k == 2 then
            entity.scale = 4
            entity.x = VIRTUAL_WIDTH - entity.width * 2 + 40
            entity.y = -40
        end

    end
end
