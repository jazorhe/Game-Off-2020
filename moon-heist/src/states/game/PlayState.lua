PlayState = Class{__includes = BaseState}

function PlayState:init()

    gSounds['field-music']:setLooping(true)
    gSounds['field-music']:play()

    self.resources = {
        ['money'] = 2000,
        ['food'] = 2000,
        ['energy'] = 2000,
        ['perception'] = 2000
    }

    self.yellowSide = Side({
        name = 'yellow',
        colour = table.pack(rgb(217, 186, 22)),
        background = 'yellow-ground',
        facilities = FACILITY_DEFS['yellow'],
        baseX = 0
    })

    self.PurpleSide = Side({
        name = 'purple',
        colour = table.pack(rgb(171, 42, 232)),
        background = 'purple-ground',
        facilities = FACILITY_DEFS['purple'],
        baseX = VIRTUAL_WIDTH
    })

    self.sides = {self.yellowSide, self.PurpleSide}
    self.currentSide = self.yellowSide

    self.cameraX = 0
    self.cameraY = 0
    self.shifting = false

    Event.on('shift-right', function(params)
        self:beginShifting(self.PurpleSide, VIRTUAL_WIDTH, 0, params)
    end)

    Event.on('shift-left', function(params)
        self:beginShifting(self.yellowSide, -VIRTUAL_WIDTH, 0, params)
    end)

end

function PlayState:update(dt)

    if love.keyboard.wasPressed('d') and not self.shifting and self.currentSide.name == 'yellow' then
        Event.dispatch('shift-right', {})
    end

    if love.keyboard.wasPressed('a') and not self.shifting and self.currentSide.name == 'purple' then
        Event.dispatch('shift-left', {})
    end

    self.currentSide:update(dt)
    if self.nextSide then
        self.nextSide:update(dt)
    end

end

function PlayState:render()
    love.graphics.push()
    if self.shifting then
        love.graphics.translate(-math.floor(self.cameraX), -math.floor(self.cameraY))
    end

    self.currentSide:render(self.resources)
    if self.nextSide then
        self.nextSide:render(self.resources)
    end
    love.graphics.pop()
end

function PlayState:beginShifting(nextSide, shiftX, shiftY, params)
    gSounds['blip']:play()

    self.shifting = true
    self.nextSide = nextSide

    -- self.nextSide.adjacentOffsetX = shiftX
    -- self.nextSide.adjacentOffsetY = shiftY

    -- if shiftX > 0 then
    --     playerX = VIRTUAL_WIDTH + (MAP_RENDER_OFFSET_X + TILE_SIZE)
    -- elseif shiftX < 0 then
    --     playerX = -VIRTUAL_WIDTH + (MAP_RENDER_OFFSET_X + (MAP_WIDTH * TILE_SIZE) - TILE_SIZE - self.player.width)
    -- elseif shiftY > 0 then
    --     playerY = VIRTUAL_HEIGHT + (MAP_RENDER_OFFSET_Y + self.player.height / 2)
    -- else
    --     playerY = -VIRTUAL_HEIGHT + MAP_RENDER_OFFSET_Y + (MAP_HEIGHT * TILE_SIZE) - TILE_SIZE - self.player.height
    -- end

    -- tween the camera in whichever direction the new room is in, as well as the player to be
    -- at the opposite door in the next room, walking through the wall (which is stenciled)
    Timer.tween(1, {
        [self] = {cameraX = shiftX, cameraY = shiftY},
        -- [self.player] = {x = playerX, y = playerY}
    }):finish(function()
        self.currentSide.baseX = -shiftX
        self:finishShifting(nextSide)
        -- -- reset player to the correct location in the room
        -- if shiftX < 0 then
        --     self.player.x = MAP_RENDER_OFFSET_X + (MAP_WIDTH * TILE_SIZE) - TILE_SIZE - self.player.width
        --     self.player.direction = 'left'
        -- elseif shiftX > 0 then
        --     self.player.x = MAP_RENDER_OFFSET_X + TILE_SIZE
        --     self.player.direction = 'right'
        -- elseif shiftY < 0 then
        --     self.player.y = MAP_RENDER_OFFSET_Y + (MAP_HEIGHT * TILE_SIZE) - TILE_SIZE - self.player.height
        --     self.player.direction = 'up'
        -- else
        --     self.player.y = MAP_RENDER_OFFSET_Y + self.player.height / 2
        --     self.player.direction = 'down'
        -- end

        -- -- close all doors in the current room
        -- for k, doorway in pairs(self.currentRoom.doorways) do
        --     doorway.open = false
        -- end
        --
        -- gSounds['door']:play()
    end)
end

--[[
    Resets a few variables needed to perform a camera shift and swaps the next and
    current room.
]]
function PlayState:finishShifting(nextSide)
    self.cameraX = 0
    self.cameraY = 0
    self.shifting = false
    self.currentSide = nextSide
    self.currentSide.baseX = 0
    self.nextSide = nil
    -- self.currentSide.adjacentOffsetX = 0
    -- self.currentSide.adjacentOffsetY = 0
end
