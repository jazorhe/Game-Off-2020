Panel = Class{}

function Panel:init(x, y, width, height, colour)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.colour = colour

    self.visible = true
end

function Panel:update(dt)

end

function Panel:render()
    if self.visible then
        love.graphics.setColor(rgba(255, 255, 255, 0.8))
        love.graphics.rectangle('line', self.x, self.y, self.width, self.height, 3)
        love.graphics.setColor(self.colour)
        love.graphics.rectangle('fill', self.x + 2, self.y + 2, self.width - 4, self.height - 4, 3)
        love.graphics.setColor(rgba(255, 255, 255, 255))
    end
end

function Panel:toggle()
    self.visible = not self.visible
end
