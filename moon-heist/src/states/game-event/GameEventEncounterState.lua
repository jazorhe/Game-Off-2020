GameEventEncounterState = Class{}

function GameEventEncounterState:init(gameEvent)
    self.gameEvent = gameEvent
    self.allowInput = false

    Timer.after(1.5, function()
        self.allowInput = true
    end)
end


function GameEventEncounterState:enter()
    self.gameEvent.state = 'encounter'
    gSounds['bell']:stop()
    gSounds['bell']:play()

    self.encounterDialogue = Textbox(
        160, VIRTUAL_HEIGHT / 2 - 80, VIRTUAL_WIDTH - 320, 100,
        self.gameEvent.dialogues[0],
        12, gFonts['small'], 'dialogue', gColours[self.gameEvent.side].ui_bg, gColours[self.gameEvent.side].ui_text, 12, 7)

    self.selectionPrompt = Textbox(
        160, VIRTUAL_HEIGHT / 2 - 80, VIRTUAL_WIDTH - 320, 40,
        self.gameEvent.selections['seleciton-prompt'],
        12, gFonts['small'], 'dialogue', gColours[self.gameEvent.side].ui_bg, gColours[self.gameEvent.side].ui_text, 12, 3)

    self.selectionMenu = Menu({
        x = 160,
        y = VIRTUAL_HEIGHT / 2 - 30,
        width = VIRTUAL_WIDTH - 320,
        height = 100,
        items = {
            self.gameEvent.selections[1],
            self.gameEvent.selections[2]
        },
        bgcolour = gColours[self.gameEvent.side].ui_bg,
        textcolour = gColours[self.gameEvent.side].ui_text
    })

    self.selecting = false
end

function GameEventEncounterState:update(dt)
    if self.allowInput then
        if love.keyboard.wasPressed('escape') or love.mouse.wasPressed(2) then
            gStateStack:push(PauseState())
        end

        if self.encounterDialogue:isClosed() then

            if self.closingDialogue then
                self.selecting = false
                self.closingDialogue:update(dt)
                if self.closingDialogue:isClosed() then
                    self.gameEvent:changeState('progressing')
                    gStateStack:pop()
                end
            end

            if not self.gameEvent.selected then
                self.selecting = true
                self.selectionMenu:update(dt, self.gameEvent, function(selection)
                    self.gameEvent.selected = selection
                    self.closingDialogue = Textbox(
                    160, VIRTUAL_HEIGHT / 2 - 80, VIRTUAL_WIDTH - 320, 100,
                    self.gameEvent.selections[self.gameEvent.selected].closing,
                    12, gFonts['small'], 'dialogue', gColours[self.gameEvent.side].ui_bg,
                    gColours[self.gameEvent.side].ui_text, 12, 7)
                    self.selecting = false
                end)
            end

        else
            self.encounterDialogue:update(dt)
        end
    end
end

function GameEventEncounterState:exit()

end

function GameEventEncounterState:render()
    love.graphics.setFont(gFonts['medium'])
    love.graphics.setColor(gColours[self.gameEvent.side].main)

    local text = 'General Event!'
    if self.gameEvent.side == 'general' then
        text = 'General Event!'
    elseif self.gameEvent.side == 'yellow' then
        text = 'Yellow Event!'
    elseif self.gameEvent.side == 'purple' then
        text = 'Purple Event!'
    end

    love.graphics.printf(self.gameEvent.name, 0, 60, VIRTUAL_WIDTH, 'center')

    self.encounterDialogue:render()

    if self.selecting then
        self.selectionPrompt:render()
        self.selectionMenu:render()
    end

    if self.closingDialogue then
        self.closingDialogue:render()
    end

end
