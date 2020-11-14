GameEvent = Class{}

function GameEvent:init(def)
    self.side = def.side
    self.dialogues = def.dialogues
    self.selections = def.selections
    self.outcomes = def.outcomes
    self.sprites = def.sprites
    self.gameEventFunctions = def.gameEventFunctions
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
