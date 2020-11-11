Facility = Class{}

function Facility:init(def, params)
    self.type = def.type
    self.side = def.side
    self.colour = params.colour
    self.buildCost = def.buildCost
    self.downGradeEarn = def.downGradeEarn
    self.regCost = def.regCost
    self.regEarn = def.regEarn
    self.animations = self:createAnimations(def.animations)

    self.width = def.width or 48
    self.height = def.height or 48

    self.currentLevel = def.initLevel or 0
    self:changeAnimation('idle-' .. tostring(self.currentLevel))

    self.mapX = def.mapX
    self.mapY = def.mapY
    self.x = (self.mapX - 1) * FACILITY_SIZE
    self.y = (self.mapY - 1) * FACILITY_SIZE - self.height / 2

    if self.side == 'yellow' then
        self.offsetX = def.offsetX or VIRTUAL_WIDTH / 2
        self.offsetY = def.offsetY or VIRTUAL_HEIGHT / 2
    elseif self.side == 'purple' then
        self.offsetX = def.offsetX or VIRTUAL_WIDTH / 2 - 3 * FACILITY_SIZE
        self.offsetY = def.offsetY or VIRTUAL_HEIGHT / 2
    end

    self.renderLayer = def.renderLayer
    -- https://love2d.org/forums/viewtopic.php?t=79617
    -- white shader that will turn a sprite completely white when used; allows us
    -- to brightly blink the sprite when it's acting
    self.whiteShader = love.graphics.newShader[[
        extern float WhiteFactor;

        vec4 effect(vec4 vcolor, Image tex, vec2 texcoord, vec2 pixcoord)
        {
            vec4 outputcolor = Texel(tex, texcoord) * vcolor;
            outputcolor.rgb += vec3(WhiteFactor);
            return outputcolor;
        }
    ]]
end

function Facility:changeAnimation(name)
    self.currentAnimation = self.animations[name]
end

-- function Facility:changeState(name, params)
--     info = params or {}
--     self.stateMachine:change(name, info)
-- end

function Facility:createAnimations(animations)
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

function Facility:update(dt)
    self.currentAnimation:update(dt)
    -- self.stateMachine:update(dt)
    if self:isHovered() then
        if love.mouse.keysPressed[1] then
            self:levelUp(1)
        elseif love.mouse.keysPressed[2] then
            self:levelUp(-1)
        end
    end


end

function Facility:render(baseX)
    -- self.stateMachine:render()
    local anim = self.currentAnimation

    love.graphics.setShader(self.whiteShader)
    self.whiteShader:send('WhiteFactor', self:isHovered() and 0.5 or 0)

    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()], self.x + self.offsetX + baseX , self.y + self.offsetY + (self:isHovered() and -10 or 0))

    love.graphics.setShader()

    love.graphics.setColor(self.colour)
    love.graphics.print("Level " .. tostring(self.currentLevel), self.x + self.offsetX + baseX + 5, self.y + self.offsetY + (self:isHovered() and -10 or 0) + 3)

    love.graphics.setColor(WHITE)

end

function Facility:isHovered()
    if mouseX > self.x + self.offsetX and mouseX < self.x + self.offsetX + FACILITY_SIZE then
        if mouseY > self.y + self.offsetY and mouseY < self.y + self.offsetY + FACILITY_SIZE then
            return true
        end
    end
    return false
end

function Facility:levelUp(n)
    if n > 0 then
        local hasEnough = self:checkResource({
            resourceTable = self.buildCost[(self.currentLevel == 3 and 0 or self.currentLevel + 1)]
        })

        if hasEnough and self.currentLevel < 3 then
            Event.dispatch('resource-management', {
                resourceTable = self.buildCost[(self.currentLevel == 3 and 0 or self.currentLevel + 1)]
            })
            gSounds['levelup']:stop()
            gSounds['levelup']:play()
        else
            gSounds['error']:stop()
            gSounds['error']:play()
            return false
        end
    else
        Event.dispatch('resource-management', {
            resourceTable = self.downGradeEarn[(self.currentLevel == 0 and 3 or self.currentLevel - 1)]
        })
    end

    self.currentLevel = self.currentLevel + n
    if self.currentLevel > 3 then self.currentLevel = 3 end
    if self.currentLevel < 0 then self.currentLevel = 0 end
    self:changeAnimation('idle-' .. tostring(self.currentLevel))
end

function Facility:checkResource(params)
    if self.resources['money'] + params.resourceTable['money'] < 0 or self.resources['food'] + params.resourceTable['food'] < 0 or self.resources['energy'] + params.resourceTable['energy'] < 0 or self.resources['perception'] + params.resourceTable['perception'] < 0 then
        return false
    end
    return true
end
