GameEventPrograssingState = Class{}

function GameEventPrograssingState:init(gameEvent)
    self.gameEvent = gameEvent
end

function GameEventPrograssingState:update(dt)
end

function GameEventPrograssingState:enter()
    self.gameEvent.state = 'progressing'
end

function GameEventPrograssingState:exit()
end

function GameEventPrograssingState:render()
end
