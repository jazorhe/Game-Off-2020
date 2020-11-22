GameEventDisplayState = Class{__includes = BaseState}

function GameEventDisplayState:init(gameEvent)
    self.statename = 'GameEventDisplayState'
    self.gameEvent = gameEvent
end

function GameEventDisplayState:update(dt)
    self.gameEvent.stateMachine:update(dt)
end


function GameEventDisplayState:render()
    love.graphics.setColor(0, 0, 0, 0.5)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
    self.gameEvent.stateMachine:render()
end
