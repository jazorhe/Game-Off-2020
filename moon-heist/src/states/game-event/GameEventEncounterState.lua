GameEventEncounterState = Class{}

function GameEventEncounterState:init(gameEvent)
    self.gameEvent = gameEvent
end


function GameEventEncounterState:enter()
    self.gameEvent.state = 'encounter'

    self.encounterDialogue = Textbox(
        160, VIRTUAL_HEIGHT / 2 - 80, VIRTUAL_WIDTH - 320, 100,
        self.gameEvent.dialogues[0],
        12, gFonts['small'], 'dialogue', YELLOW, 12, 7)

    self.selectionPrompt = Textbox(
        160, VIRTUAL_HEIGHT / 2 - 80, VIRTUAL_WIDTH - 320, 40,
        self.gameEvent.selections['seleciton-prompt'],
        12, gFonts['small'], 'dialogue', YELLOW, 12, 3)

    self.selections = Menu({
        x = 160,
        y = VIRTUAL_HEIGHT / 2 - 30,
        width = VIRTUAL_WIDTH - 320,
        height = 100,
        items = {
            self.gameEvent.selections[1],
            self.gameEvent.selections[2]
        },
        colour = YELLOW
    })

    self.selecting = false
end

function GameEventEncounterState:update(dt)
    if self.encounterDialogue:isClosed() then
        self.selecting = true
        -- self.selectionPrompt:update(dt)
        self.selections:update(dt, self.gameEvent)
    else
        self.encounterDialogue:update(dt)
    end
end

function GameEventEncounterState:exit()

end

function GameEventEncounterState:render()
    love.graphics.setFont(gFonts['medium'])
    love.graphics.setColor(YELLOW)
    love.graphics.printf("New Event!", 0, 60, VIRTUAL_WIDTH, 'center')

    self.encounterDialogue:render()
    if self.selecting then
        self.selectionPrompt:render()
        self.selections:render()
    end
end
