Sky = Class{}

function Sky:init(def)
    self.baseX = def.baseX
    self.side = def.side
    self.colour = def.starColour
    self.stars = {}
    self.newa = 0.5
    for i = 1, 7 do
        self:generateStar()
    end

    Timer.every(1.2, function() self:twinkleStars() end)
end

function Sky:update(dt)
    for k, star in pairs(self.stars) do
        star.psystem:update(dt)
    end

    for k = #self.stars, 1, -1 do
        if self.stars[k].remove then
            table.remove(self.stars, k)
            self:generateStar()
        end
    end
end

function Sky:render()
    for k, star in pairs(self.stars) do
        love.graphics.draw(star.psystem, star.x + self.baseX, star.y)
    end
end

function Sky:generateStar()

    local x = math.random(0, VIRTUAL_WIDTH)
    local y = math.random(0, VIRTUAL_HEIGHT)
    while not self:isSky(self.side, x, y) do
        x = math.random(0, VIRTUAL_WIDTH)
        y = math.random(0, VIRTUAL_HEIGHT)
    end

    local psystem = love.graphics.newParticleSystem(gTextures['particle'], 1)
    psystem:setSizes(math.random(2) == 2 and 0.2 or 0.3)
    psystem:setParticleLifetime(1.2, 3.6)
    psystem:setColors(self.colour)
    -- psystem:setLinearAcceleration(-15, -20, 15, 10)
    psystem:setEmissionArea('normal', 0, 0)

    table.insert(self.stars, {
        x = x,
        y = y,
        psystem = psystem
    })

end

function Sky:isSky(side, x, y)
    if side == 'yellow' then
        if y < - (VIRTUAL_HEIGHT / VIRTUAL_WIDTH) * x + VIRTUAL_HEIGHT then
            return true
        end
    elseif side == 'purple' then
        if y < (VIRTUAL_HEIGHT / VIRTUAL_WIDTH) * x then
            return true
        end
    end
    return false
end

function Sky:twinkleStars()
    for k, star in pairs(self.stars) do
        if math.random(10) < 10 then
            star.psystem:emit(1)
        end
        if math.random(10) > 9 then
            star.remove = true
        end
    end
end
