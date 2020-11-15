GameEventPassedState = Class{}

function GameEventPassedState:init(gameEvent)
    self.gameEvent = gameEvent
end

function GameEventPassedState:update(dt)
end

function GameEventPassedState:enter()
    self.gameEvent.state = 'passed'
end

function GameEventPassedState:exit()
end

function GameEventPassedState:render()
end
