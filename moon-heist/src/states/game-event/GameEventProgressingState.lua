GameEventProgressingState = Class{}

function GameEventProgressingState:init(gameEvent)
    self.gameEvent = gameEvent
end

function GameEventProgressingState:update(dt)
end

function GameEventProgressingState:enter()
    self.gameEvent.state = 'progressing'
end

function GameEventProgressingState:exit()
end

function GameEventProgressingState:render()
end
