Menu = Class{}

function Menu:init(def)
    self.panel = Panel(def.x, def.y, def.width, def.height, def.bgcolour)

    self.selection = Selection {
        items = def.items,
        x = def.x,
        y = def.y,
        width = def.width,
        height = def.height,
        textcolour = def.textcolour
    }
end

function Menu:update(dt, gameEvent, callback)
    self.selection:update(dt, gameEvent, callback)
end

function Menu:render()
    self.panel:render()
    self.selection:render()
end
