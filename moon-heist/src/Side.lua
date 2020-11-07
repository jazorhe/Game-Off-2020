Side = Class{}

function Side:init(def)
    self.name = def.name
    self.colour = def.colour
    self.background = def.background
    self.facilities = {}
    self.baseX = def.baseX

    for i = 1, 6 do
        table.insert(self.facilities, Facility(def.facilities[i]))
    end
end

function Side:createAnimations(animations)
    local animationsReturned = {}

    for k, animationDef in pairs(animations) do
        animationsReturned[k] = Animation {
            texture = animationDef.texture,
            frames = animationDef.frames,
            interval = animationDef.interval
        }
    end

    return animationsReturned
end

function Side:changeState(name, params)
    info = params or {}
    self.stateMachine:change(name, info)
end

function Side:update(dt)
    -- self.currentAnimation:update(dt)
    -- self.stateMachine:update(dt)

    for k, facility in pairs(self.facilities) do
        facility:update(dt)
    end
end

function Side:render(resources)
    -- self.stateMachine:render()
    table.sort(self.facilities, function (k1, k2) return k1.renderLayer > k2.renderLayer end )
    for k, facility in pairs(self.facilities) do
        facility:render(self.baseX)
    end

    love.graphics.setColor(unpack(self.colour))
    love.graphics.setFont(gFonts['small'])
    love.graphics.printf('Money: ' .. tostring(resources['money']), self.baseX + 20, VIRTUAL_HEIGHT - 48, self.baseX + VIRTUAL_WIDTH, 'left')
    love.graphics.printf('Food: ' .. tostring(resources['food']), self.baseX + 20, VIRTUAL_HEIGHT - 36, self.baseX + VIRTUAL_WIDTH, 'left')
    love.graphics.printf('Energy: ' .. tostring(resources['energy']), self.baseX + 20, VIRTUAL_HEIGHT - 24, self.baseX + VIRTUAL_WIDTH, 'left')
    love.graphics.printf('Perception: ' .. tostring(resources['perception']), self.baseX + 20, VIRTUAL_HEIGHT - 12, self.baseX + VIRTUAL_WIDTH, 'left')

    love.graphics.setColor(rgb(255, 255, 255))
end
