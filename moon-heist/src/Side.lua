Side = Class{}

function Side:init(def)
    self.name = def.name
    self.background = def.background
    self.facilities = {}

    for i = 1, 6 do
        table.insert(self.facilities, Facility(def.facilities[i]))
    end
end

function Side:createAnimations(animations)
    local animationsReturned = {}

    for k, animationDef in pairs(animations) do
        animationsReturned[k] = Animation {
            texture = animationDef.texture or 'facilities',
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

function Side:render()
    -- self.stateMachine:render()
    table.sort(self.facilities, function (k1, k2) return k1.renderLayer < k2.renderLayer end )
    for k, facility in pairs(self.facilities) do
        facility:render()
    end

end
