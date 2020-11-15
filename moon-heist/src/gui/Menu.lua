Menu = Class{}

function Menu:init(def)
    self.panel = Panel(def.x, def.y, def.width, def.height, def.colour)

    self.selection = Selection {
        items = def.items,
        x = def.x,
        y = def.y,
        width = def.width,
        height = def.height
    }
end

function Menu:update(dt, gameEvent)
    self.selection:update(dt, gameEvent)
end

function Menu:render()
    self.panel:render()
    self.selection:render()
end
