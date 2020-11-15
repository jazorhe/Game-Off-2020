GameEventResolveState = Class{}

function GameEventResolveState:init(gameEvent)
    self.gameEvent = gameEvent
end

function GameEventResolveState:update(dt)
end

function GameEventResolveState:enter()
    self.gameEvent.state = 'resolve'
end

function GameEventResolveState:exit()
end

function GameEventResolveState:render()
end
