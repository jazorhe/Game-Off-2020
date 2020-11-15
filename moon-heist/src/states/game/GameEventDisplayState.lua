GameEventDisplayState = Class{__includes = BaseState}

function GameEventDisplayState:init(gameEvent)
    self.gameEvent = gameEvent
end

function GameEventDisplayState:update(dt)
    self.gameEvent.stateMachine:update(dt)
end

function GameEventDisplayState:render()
    self.gameEvent.stateMachine:render()
end
