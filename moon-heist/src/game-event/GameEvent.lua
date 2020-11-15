GameEvent = Class{}

function GameEvent:init(def)
    self.settings = def
    self.side = def.side
    self.typpe = def.type
    self.encounterTurn = def.encounter
    self.resolveTurn = def.resolve
    self.dialogues = def.dialogues
    self.selections = def.selections
    self.outcomes = def.outcomes
    self.sprites = def.sprites
    self.gameEventFunctions = def.gameEventFunctions

    self.stateMachine = StateMachine {
        ['planned'] = function() return GameEventPlannedState(self) end,
        ['encounter'] = function() return GameEventEncounterState(self) end,
        ['progressing'] = function() return GameEventProgressingState(self) end,
        ['resolve'] = function() return GameEventResolveState(self) end,
        ['passed'] = function() return GameEventPassedState(self) end
    }

    self.selected = nil
    self:changeState('planned')
end

function GameEvent:getSettings()
    return self.settings
end

function GameEvent:changeState(name)
    self.stateMachine:change(name)
end

function GameEvent:update(dt)
    self.stateMachine:update(dt)
end

function GameEvent:render()
    self.stateMachine:render()
end
