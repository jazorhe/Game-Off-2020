Facility = Class{}

function Facility:init(def)
    self.type = def.type
    self.side = def.side
    self.buildCost = def.buildCost
    self.regCost = def.regCost
    self.regEarn = def.regEarn
    self.animations = self:createAnimations(def.animations)

    self.width = def.width
    self.height = def.height

    self.currentLevel = def.initLevel

    self.mapX = def.mapX
    self.mapY = def.mapY
    self.x = (self.mapX - 1) * BUILDING_SIZE
    self.y = (self.mapY - 1) * BUILDING_SIZE - self.height / 2

end

function Facility:changeState(name, params)
    info = params or {}
    self.stateMachine:change(name, info)
end

function Facility:changeAnimation(name)
    self.currentAnimation = self.animations[name]
end

function Facility:createAnimations(animations)
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

function Facility:update(dt)
    self.currentAnimation:update(dt)
    self.stateMachine:update(dt)
end

function Facility:render()
    self.stateMachine:render()
end
