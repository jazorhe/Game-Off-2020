GameEventPlannedState = Class{}

function GameEventPlannedState:init(gameEvent)
    self.gameEvent = gameEvent
end

function GameEventPlannedState:update(dt)
end

function GameEventPlannedState:enter()
    self.gameEvent.state = 'planned'
end

function GameEventPlannedState:exit()
end

function GameEventPlannedState:render()
end
