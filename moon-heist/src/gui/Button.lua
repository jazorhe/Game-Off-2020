Button = Class{}

function Button:init(def)
    self.type = def.type
    self.x = def.x
    self.y = def.y
    self.width = def.width
    self.height = def.height
    self.texture = def.texture
    self.onSelect = def.onSelect
    self.bgcolour = def.bgcolour
    self.textcolour = def.textcolour
    self.font = def.font
    self.text = def.text
    self.side = def.side
end

function Button:update()
    if self:isHovered() then
        if love.mouse.wasPressed(1) then
            self.onSelect()
        end
    end
end

function Button:render()

    love.graphics.setColor(self.bgcolour)
    if self:isHovered() then
        local r, g, b, a = unpack(self.bgcolour)
        love.graphics.setColor(r + 0.05, g + 0.05, b + 0.05, a)
    end

    if self.type == 'rectangle' then
        love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)

        love.graphics.setFont(self.font)
        love.graphics.setColor(self.textcolour)
        love.graphics.printf(self.text, self.x, self.y + self.height / 2 - self.font:getHeight() / 2, self.width, 'center')

    elseif self.type == 'triangle' then
        if self.side == 'yellow' then
            love.graphics.polygon('fill', self.x, self.y, self.x + self.width, self.y + self.height / 2, self.x, self.y + self.height)
        elseif self.side == 'purple' then
            love.graphics.polygon('fill', self.x + self.width, self.y, self.x, self.y + self.height / 2, self.x + self.width, self.y + self.height)
        end

        love.graphics.setFont(self.font)
        love.graphics.setColor(self.textcolour)
        love.graphics.printf(self.text, self.x, self.y + self.height / 2 - self.font:getHeight() / 2, self.width, 'center')

    elseif self.type == 'sprite' then

    else

    end

    love.graphics.setColor(WHITE)
end

function Button:isHovered()
    if mouseX > self.x and mouseX < self.x + self.width then
        if mouseY > self.y and mouseY < self.y + self.height then
            return true
        end
    end
    return false
end
