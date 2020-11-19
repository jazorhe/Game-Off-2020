GameEventResolveState = Class{}

function GameEventResolveState:init(gameEvent)
    self.gameEvent = gameEvent
    self.resolved = false
end

function GameEventResolveState:enter()
    self.gameEvent.state = 'resolve'

    self.resolveDialogue = Textbox(
        160, VIRTUAL_HEIGHT / 2 - 80, VIRTUAL_WIDTH - 320, 100,
        self.gameEvent.dialogues[self.gameEvent.selected],
        12, gFonts['small'], 'dialogue', gColours[self.gameEvent.side].ui_bg,
        gColours[self.gameEvent.side].ui_text, 12, 7)

    self.closingDialogue = Textbox(
        160, VIRTUAL_HEIGHT / 2 - 80, VIRTUAL_WIDTH - 320, 100,
        self.gameEvent.dialogues[3],
        12, gFonts['small'], 'dialogue', gColours[self.gameEvent.side].ui_bg,
        gColours[self.gameEvent.side].ui_text, 12, 7)
end

function GameEventResolveState:update(dt)
    if love.keyboard.wasPressed('escape') or love.mouse.wasPressed(2) then
        gStateStack:push(PauseState())
    end
    
    if self.resolveDialogue:isClosed() then
        if not self.resolved then
            Event.dispatch('trust-management', {
                trust = self.gameEvent.outcomes[self.gameEvent.selected].trust,
                side = self.gameEvent.outcomes[self.gameEvent.selected].side
            })
            Event.dispatch('resource-management', {
                resourceTable = self.gameEvent.outcomes[self.gameEvent.selected].resources
            })
            self.resolved = true
        end

        self.closingDialogue:update(dt)
        if self.closingDialogue:isClosed() then
            self.gameEvent:changeState('passed')
            gStateStack:pop()
        end
    else
        self.resolveDialogue:update(dt)
    end
end

function GameEventResolveState:exit()
end

function GameEventResolveState:render()
    love.graphics.setFont(gFonts['medium'])
    love.graphics.setColor(gColours[self.gameEvent.side].main)
    love.graphics.printf("Resolve!", 0, 60, VIRTUAL_WIDTH, 'center')

    self.resolveDialogue:render()
    if self.resolveDialogue:isClosed() then
        self.closingDialogue:render()
    end
end
