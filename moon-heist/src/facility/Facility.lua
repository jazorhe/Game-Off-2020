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
        self.defaultOffsetX = def.offsetX
        or VIRTUAL_WIDTH - 4.5 * FACILITY_SIZE - (3 - self.mapX) * 20 - (self.mapY - 1) * 30
        self.defaultOffsetY = def.offsetY
        or VIRTUAL_HEIGHT / 5 * 3 + (self.mapY - 1) * 4 - 20

        if self.type == 'harbour' then
            self.defaultOffsetX = self.defaultOffsetX - FACILITY_SIZE * 4
            self.defaultOffsetY = self.defaultOffsetY - FACILITY_SIZE * 2 + 24
        end

    elseif self.side == 'purple' then
        self.defaultOffsetX = def.offsetX
        or FACILITY_SIZE + (self.mapX - 1) * 48 + (self.mapY - 1) * 36 - 18
        self.defaultOffsetY = def.offsetY
        or VIRTUAL_HEIGHT / 5 * 3 + (self.mapY - 1) * 18 - (self.mapX - 1) * 12 - 10

        if self.type == 'sail' then
            self.defaultOffsetX = self.defaultOffsetX
            self.defaultOffsetY = self.defaultOffsetY - FACILITY_SIZE * 2 + 24
        end


    end

    self.offsetX = math.floor(self.defaultOffsetX)
    self.offsetY = math.floor(self.defaultOffsetY)

    self.actualX = self.x + self.offsetX
    self.actualY = self.y + self.offsetY

    self.colour = gColours[self.side].main
    self.uiBgColour = gColours[self.side].ui_bg
    self.uiTextColour = gColours[self.side].ui_text

    self.renderLayer = def.renderLayer
    self.canHover = true

    self.panelOffsetX = 0
    self.panelOffsetY = 0

    if self.type == 'harbour' then
        self.panelOffsetX = FACILITY_SIZE * 4
        self.panelOffsetY = FACILITY_SIZE * 2
    elseif self.type == 'sail' then
        self.panelOffsetY = FACILITY_SIZE * 4
    end

    self.infoTextbox = Textbox(
        self.actualX - 15 + self.panelOffsetX,
        self.actualY - 80 + self.panelOffsetY,
        FACILITY_SIZE * 2 + 30, 80,
        "", 12, gFonts['small'], 'info', self.uiBgColour,
        self.uiTextColour, 12)

    self.upgradeConfirm = Menu({
        items = {
            [1] = {
                text = "Upgrade",
                onSelect = function()
                    self:levelUp(1)
                    self.displayUpgradeConfirm = false
                    self.displayInfo = true
                    love.mouse.keysPressed = {}
                end
            },
            [2] = {
                text = "Cancel",
                onSelect = function()
                    self.displayUpgradeConfirm = false
                    self.displayInfo = true
                    love.mouse.keysPressed = {}
                end
            }
        },
        x = self.actualX + 10 + self.panelOffsetX,
        y = self.actualY - 15 + self.panelOffsetY,
        width = FACILITY_SIZE * 2 - 20,
        height = 30,
        bgcolour = self.uiBgColour,
        textcolour = self.uiTextColour
    })

    self.upgradeInfo = Textbox(
        self.actualX + 10 + self.panelOffsetX,
        self.actualY - 85 + self.panelOffsetY,
        FACILITY_SIZE * 2 - 20, 65,
        "", 12, gFonts['small'], 'info', self.uiBgColour,
        self.uiTextColour, 12)

    self.displayInfo = false
    self.displayUpgradeConfirm = false

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

    Event.on('shift-right', function(params)
        self.displayInfo = false
        self.displayUpgradeConfirm = false
    end)

    Event.on('shift-left', function(params)
        self.displayInfo = false
        self.displayUpgradeConfirm = false
    end)

    Event.on('win-ready', function(params)
        self.win = params.side
    end)

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

    if self.displayUpgradeConfirm then
        self.upgradeConfirm:update()
        self.upgradeInfo:update(dt, {
            text = (self.currentLevel < 3 and "Upgrade Cost\n" ..
            "M: " .. tostring(self.buildCost[self.currentLevel + 1]['money']) .. "\n" ..
            "F: " .. tostring(self.buildCost[self.currentLevel + 1]['food']) .. "\n" ..
            "E: " .. tostring(self.buildCost[self.currentLevel + 1]['energy']) .. "\n" ..
            "A: " .. tostring(self.buildCost[self.currentLevel + 1]['amenity']) .. "\n"
        or "")
        })
    end

    if self.currentLevel == 3 then
        if self.type == 'harbour' and not self.win then
            Event.dispatch('win-ready', {side = self.side})
        end
        if self.type == 'sail' and not self.win then
            Event.dispatch('win-ready', {side = self.side})
        end
    end

    if DEBUG and DEBUG_FACILITY then
        if self:isHovered() and love.mouse.wasPressed(3) then
            self.debugSelected = true
        elseif love.mouse.wasPressed(3) or love.mouse.wasPressed(1) then
            self.debugSelected = false
        end

        if love.keyboard.wasPressed('left') and self.debugSelected then
            self.actualX = self.actualX - 1
        elseif love.keyboard.wasPressed('right') and self.debugSelected then
            self.actualX = self.actualX + 1
        elseif love.keyboard.wasPressed('up') and self.debugSelected then
            self.actualY = self.actualY - 1
        elseif love.keyboard.wasPressed('down') and self.debugSelected then
            self.actualY = self.actualY + 1
        end
    end
end

function Facility:render(baseX)
    -- self.stateMachine:render()
    local anim = self.currentAnimation

    love.graphics.setShader(self.whiteShader)
    self.whiteShader:send('WhiteFactor', self:isHovered() and 0.1 or 0)

    local scale = self.scale
    if self.currentLevel == 0 and self.side == 'purple' and self.type ~= 'sail' then
        scale = 1
    end

    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()], self.actualX + baseX, self.actualY + (self:isHovered() and -0 or 0), 0, scale, scale)


    love.graphics.setShader()

    love.graphics.setColor(WHITE)

    if self.displayUpgradeConfirm then
        self.upgradeConfirm:render()
        self.upgradeInfo:render()
    elseif self.displayInfo then
        self.infoTextbox:render()
    end

    if DEBUG and DEBUG_FACILITY then
        love.graphics.setColor(self.colour)
        love.graphics.setFont(gFonts['small'])
        love.graphics.print("Level " .. tostring(self.currentLevel), self.actualX + baseX + 5, self.actualY + (self:isHovered() and -0 or 0) + 3)
        love.graphics.setColor(rgb(0, 186, 255))
        if self.debugSelected then
            love.graphics.setColor(rgb(58, 198, 24))
        end

        love.graphics.rectangle('line', self.actualX + baseX, self.actualY, self.width * self.scale, self.height * self.scale)
        -- end
        love.graphics.setColor(WHITE)
    end

end

function Facility:isHovered()
    -- This function has been achieved using very specific trigonometry for our prites. Our sprites are 30-60 degrees and when handling hover actions, because of the transparent space around the sprite, multiple sprites are thought to be selected. The hover action has been handled within the Facility class for decomposition purposes, thus I would not want to handle hovering in higher level classes with layering functions just to for this puposes. Thus I went with a more complex approach. Might not be the best to do.

    local hoverShiftX = 0
    local hoverShiftY = 0
    local scale = self.scale
    local edgeAdjustment = 12
    if self.type == 'harbour' then
        hoverShiftX = FACILITY_SIZE * 4
        hoverShiftY = FACILITY_SIZE * 2
    elseif self.type == 'sail' then
        hoverShiftY = FACILITY_SIZE * 4
        scale = 2
    end

    if mouseX > self.actualX + hoverShiftX and mouseX < self.actualX + hoverShiftX + FACILITY_SIZE * 2 then
        if mouseY > self.actualY + hoverShiftY and mouseY < self.actualY + hoverShiftY + FACILITY_SIZE * 2 then

            -- exclude top left corner
            if (mouseY - self.actualY - hoverShiftY) < - math.sqrt(3) * (mouseX - self.actualX - hoverShiftX) + math.sqrt(3) / (math.sqrt(3) + 1) * FACILITY_SIZE * scale + edgeAdjustment then
                return false
            end

            -- exclude top right corner
            if (mouseY - self.actualY - hoverShiftY) < 1 / math.sqrt(3) * (mouseX - self.actualX - hoverShiftX) - 1 / (math.sqrt(3) + 3) * FACILITY_SIZE * scale + edgeAdjustment then
                return false
            end

            -- exclude bottom left corner
            if (mouseY - self.actualY - hoverShiftY) > 1 / math.sqrt(3) * (mouseX - self.actualX - hoverShiftX) + math.sqrt(3) / (math.sqrt(3) + 1) * FACILITY_SIZE * scale - edgeAdjustment then
                return false
            end

            -- exclude bottom right corner
            if (mouseY - self.actualY - hoverShiftY) > - math.sqrt(3) * (mouseX - self.actualX - hoverShiftX) + (math.sqrt(3) + 4) / (math.sqrt(3) + 1) * FACILITY_SIZE * scale - edgeAdjustment then
                return false
            end

            return true
        end
    end
    return false
end

function Facility:showInfoPanel()
    self.displayInfo = true
    self.infoTextbox:update(dt, {
        text = tostring(self.name) .. "\n" ..
        "Level: " .. tostring(self.currentLevel) ..
        (self.currentLevel < 3 and "  ->  Level: " .. tostring(self.currentLevel + 1) or "") .."\n" ..

        "M: " .. tostring(self.regEarn[self.currentLevel]['money'] + self.regCost[self.currentLevel]['money']) .. " e.a." ..
        (self.currentLevel < 3 and "  ->  " .. tostring(self.regEarn[self.currentLevel + 1]['money'] + self.regCost[self.currentLevel + 1]['money']) .. " e.a." or "") .."\n" ..

        "F: " .. tostring(self.regEarn[self.currentLevel]['food'] + self.regCost[self.currentLevel]['food']) .. " e.a." ..
        (self.currentLevel < 3 and "  ->  " .. tostring(self.regEarn[self.currentLevel + 1]['food'] + self.regCost[self.currentLevel + 1]['food']) .. " e.a." or "") .."\n" ..

        "E: " .. tostring(self.regEarn[self.currentLevel]['energy'] + self.regCost[self.currentLevel]['energy']) .. " e.a." ..
        (self.currentLevel < 3 and "  ->  " .. tostring(self.regEarn[self.currentLevel + 1]['energy'] + self.regCost[self.currentLevel + 1]['energy']) .. " e.a." or "") .."\n" ..

        "A: " .. tostring(self.regEarn[self.currentLevel]['amenity'] + self.regCost[self.currentLevel]['amenity']) .. " e.a." ..
        (self.currentLevel < 3 and "  ->  " .. tostring(self.regEarn[self.currentLevel + 1]['amenity'] + self.regCost[self.currentLevel + 1]['amenity']) .. " e.a." or "")
    })
end


function Facility:toggleUpgradePanel()
    self.displayUpgradeConfirm = not displayUpgradeConfirm
    if self.displayUpgradeConfirm then
        self.displayInfo = false
    end
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
            gSounds['blip']:stop()
            gSounds['levelup']:stop()
            gSounds['levelup']:play()
        else
            gSounds['blip']:stop()
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

    if self.resources['money'] + params.resourceTable['money'] < 0
    or self.resources['food'] + params.resourceTable['food'] < 0
    or self.resources['energy'] + params.resourceTable['energy'] < 0
    or self.resources['amenity'] + params.resourceTable['amenity'] < 0 then
        return false
    end
    return true
end
