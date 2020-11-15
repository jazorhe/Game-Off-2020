Facility = Class{}

function Facility:init(def, params)
    self.type = def.type
    self.name = def.name
    self.side = def.side

    self.buildCost = def.buildCost
    self.downGradeEarn = def.downGradeEarn
    self.regCost = def.regCost
    self.regEarn = def.regEarn
    self.animations = self:createAnimations(def.animations)

    self.width = def.width or 48
    self.height = def.height or 48
    self.scale = def.scale or 1

    self.currentLevel = def.initLevel or 0
    self:changeAnimation('idle-' .. tostring(self.currentLevel))

    self.mapX = def.mapX
    self.mapY = def.mapY
    self.x = (self.mapX - 1) * FACILITY_SIZE
    self.y = (self.mapY - 1) * FACILITY_SIZE - self.height / 2

    if self.side == 'yellow' then
        self.offsetX = def.offsetX or VIRTUAL_WIDTH - 4.5 * FACILITY_SIZE - (3 - self.mapX) * 20 - (self.mapY - 1) * 30
        self.offsetY = def.offsetY or VIRTUAL_HEIGHT / 5 * 3 + (self.mapY - 1) * 4
    elseif self.side == 'purple' then
        self.offsetX = def.offsetX or 1 * FACILITY_SIZE + (self.mapX - 1) * 30 + (self.mapY - 1) * 25
        self.offsetY = def.offsetY or VIRTUAL_HEIGHT / 5 * 3 + (self.mapY - 1) * 18
    end

    self.actualX = self.x + self.offsetX
    self.actualY = self.y + self.offsetY

    self.colour = gColours[self.side].main
    self.uiBgColour = gColours[self.side].ui_bg
    self.uiTextColour = gColours[self.side].ui_text

    self.renderLayer = def.renderLayer
    self.infoTextbox = Textbox(
        self.actualX - 10, self.actualY - 80, self.width * 2 + 20, 80,
        tostring(self.name) .. "\n Not Built",
        12, gFonts['small'], 'info', self.uiBgColour, 12)

    self.displayInfo = false


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

function Facility:update(dt, params)
    self.resources = params.resources
    self.currentAnimation:update(dt)
    -- self.stateMachine:update(dt)
    if self:isHovered() then
        if love.mouse.keysPressed[1] then
            -- self.displayInfo = true
            self:levelUp(1)
        elseif love.mouse.keysPressed[2] then
            self:levelUp(-1)
        end

        self.displayInfo = true
        self.infoTextbox:update(dt, {
            text = tostring(self.name) .. "\nLevel: " .. tostring(self.currentLevel) .. "\n"
            .. "M: " .. tostring(self.regEarn[self.currentLevel]['money'] + self.regCost[self.currentLevel]['money']) .. " e.a.\n"
            .. "F: " .. tostring(self.regEarn[self.currentLevel]['food'] + self.regCost[self.currentLevel]['food']) .. " e.a.\n"
            .. "E: " .. tostring(self.regEarn[self.currentLevel]['energy'] + self.regCost[self.currentLevel]['energy']) .. " e.a.\n"
            .. "P: " .. tostring(self.regEarn[self.currentLevel]['perception'] + self.regCost[self.currentLevel]['perception']) .. " e.a.\n"
        })
    else
        self.displayInfo = false
        if love.mouse.keysPressed[1] then
            self.displayInfo = false
        end
    end

    if self.currentLevel == 3 then
        if self.type == 'harbour' then
            Event.dispatch('win-game', {side = self.side})
        end
        if self.type == 'engine' then
            Event.dispatch('win-game', {side = self.side})
        end
    end

    -- if love.keyboard.wasPressed('left') and self.mapY == 2 then
    --     self.x = self.x - 1
    -- elseif love.keyboard.wasPressed('right') and self.mapY == 2 then
    --     self.x = self.x + 1
    -- elseif love.keyboard.wasPressed('up') and self.mapY == 2 then
    --     self.y = self.y - 1
    -- elseif love.keyboard.wasPressed('down') and self.mapY == 2 then
    --     self.y = self.y + 1
    -- end

end

function Facility:render(baseX)
    -- self.stateMachine:render()
    local anim = self.currentAnimation

    love.graphics.setShader(self.whiteShader)
    self.whiteShader:send('WhiteFactor', self:isHovered() and 0.1 or 0)

    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()], self.actualX + baseX, self.actualY + (self:isHovered() and -0 or 0), 0, self.scale, self.scale)

    love.graphics.setShader()

    -- love.graphics.setColor(self.colour)
    -- love.graphics.print("Level " .. tostring(self.currentLevel), self.actualX + baseX + 5, self.actualY + (self:isHovered() and -0 or 0) + 3)

    love.graphics.setColor(WHITE)

    if self.displayInfo then
        self.infoTextbox:render()
    end

end

function Facility:isHovered()
    -- This function has been achieved using very specific trigonometry for our prites. Our sprites are 30-60 degrees and when handling hover actions, because of the transparent space around the sprite, multiple sprites are thought to be selected. The hover action has been handled within the Facility class for decomposition purposes, thus I would not want to handle hovering in higher level classes with layering functions just to for this puposes. Thus I went with a more complex approach. Might not be the best to do.
    if mouseX > self.x + self.offsetX and mouseX < self.x + self.offsetX + FACILITY_SIZE * 2 then
        if mouseY > self.y + self.offsetY and mouseY < self.y + self.offsetY + FACILITY_SIZE * 2 then

            -- exclude top left corner
            if (mouseY - self.y - self.offsetY) < - math.sqrt(3) * (mouseX - self.x - self.offsetX) + math.sqrt(3) / (math.sqrt(3) + 1) * self.width * self.scale + 12 then
                return false
            end

            -- exclude top right corner
            if (mouseY - self.y - self.offsetY) < 1 / math.sqrt(3) * (mouseX - self.x - self.offsetX) - 1 / (math.sqrt(3) + 3) * self.width * self.scale + 12 then
                return false
            end

            -- exclude bottom left corner
            if (mouseY - self.y - self.offsetY) > 1 / math.sqrt(3) * (mouseX - self.x - self.offsetX) + math.sqrt(3) / (math.sqrt(3) + 1) * self.width * self.scale - 12 then
                return false
            end

            -- exclude bottom right corner
            if (mouseY - self.y - self.offsetY) > - math.sqrt(3) * (mouseX - self.x - self.offsetX) + (math.sqrt(3) + 4) / (math.sqrt(3) + 1) * self.width * self.scale - 12 then
                return false
            end

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
    if CHEAT_MODE then
        return true
    end

    if self.resources['money'] + params.resourceTable['money'] < 0 or self.resources['food'] + params.resourceTable['food'] < 0 or self.resources['energy'] + params.resourceTable['energy'] < 0 or self.resources['perception'] + params.resourceTable['perception'] < 0 then
        return false
    end
    return true
end
