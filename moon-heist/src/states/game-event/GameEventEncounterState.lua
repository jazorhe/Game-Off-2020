GameEventEncounterState = Class{}

function GameEventEncounterState:init(gameEvent)
    self.gameEvent = gameEvent
end


function GameEventEncounterState:enter()
    self.gameEvent.state = 'encounter'
    self.encounterDialogue = Textbox(120, VIRTUAL_HEIGHT / 2 - 80, VIRTUAL_WIDTH - 240, 160,
    self.gameEvent.dialogues[0],
    12, gFonts['medium'], 'dialogue', YELLOW, 24, 7)
    self.selectionPrompt = Textbox(120, VIRTUAL_HEIGHT / 2 - 80, VIRTUAL_WIDTH - 240, 160,
    self.gameEvent.selections['seleciton-prompt'],
    12, gFonts['medium'], 'dialogue', YELLOW, 24, 7)
    self.selecting = false
end

function GameEventEncounterState:update(dt)
    if self.encounterDialogue:isClosed() then
        self.selecting = true
    else
        self.encounterDialogue:update(dt)
    end
end

function GameEventEncounterState:exit()

end

function GameEventEncounterState:render()

    self.encounterDialogue:render()
    if self.selecting then
        self.selectionPrompt:render()
    end
end
