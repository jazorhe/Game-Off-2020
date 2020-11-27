function love.load()
    love.window.setTitle('Moon Heist')
    love.graphics.setDefaultFilter('nearest', 'nearest')
    require 'src/Dependencies'
    math.randomseed(os.time())

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true
    })

    gStateStack = StateStack()
    gStateStack:push(StartState())

    love.keyboard.keysPressed = {}
    love.mouse.keysPressed = {}
    love.keyboard.lastKeys = {}
    Timer.every(1.5, function()
        love.keyboard.lastKeys = {}
    end)
end

function love.update(dt)
    lastmouseX, lastmouseY = mouseX, mouseY
    mouseX, mouseY = push:toGame(love.mouse.getPosition())
    if not mouseX or not mouseY then mouseX, mouseY = 0, 0 end
    if not lastmouseY or not lastmouseY then lastmouseX, lastmouseY = 0, 0 end

    if math.abs(mouseX - lastmouseX) > 1 or math.abs(mouseY - lastmouseY) > 1 then
        mouseMoved = true
    else
        mouseMoved = false
    end

    if love.keyboard.wasPressed('f') then
        push:switchFullscreen(WINDOW_WIDTH, WINDOW_HEIGHT)
    end

    if love.keyboard.wasPressed('q') then
        love.event.quit()
    end

    if love.keyboard.wasPressed('m') then
        love.audio.setVolume(gMute and gVolume or 0)
        gMute = not gMute
    end

    if love.keyboard.wasPressed('0') then
        table.insert(love.keyboard.lastKeys, '0')
    end

    local dNum = 0
    for k, key in pairs(love.keyboard.lastKeys) do
        if key == '0' then
            dNum = dNum + 1
        end
    end

    if dNum > 4 then
        gStateStack:push(DebugOptionsState())
        love.keyboard.lastKeys = {}
    end

    Timer.update(dt)
    gStateStack:update(dt)

    love.keyboard.keysPressed = {}
    love.mouse.keysPressed = {}
    love.mouse.keysReleased = {}
end

function love.draw()
    push:start()
    gStateStack:render()

    if DEBUG and DEBUG_STATES then
        love.graphics.setFont(gFonts['medium'])
        love.graphics.printf(tostring(#gStateStack.states), 5, 16, VIRTUAL_WIDTH, 'left')
        for k, state in pairs(gStateStack.states)do
            love.graphics.printf(tostring(state.statename), 5, 16 + k * 20, VIRTUAL_WIDTH, 'left')
        end
    elseif DEBUG and DEBUG_MOUSE then
        love.graphics.setColor(WHITE)
        love.graphics.printf("x: ".. tostring(mouseX) .. ", y: " .. tostring(mouseY), 5, 5, VIRTUAL_WIDTH, 'left')
    end

    if gDebugDisplay then
        gDebugStatesRender()
    end

    push:finish()
end

function love.mousemoved(x, y, dx, dy)
    -- body...
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.mousepressed(x, y, key)
    love.mouse.keysPressed[key] = true
end

function love.mousereleased(x, y, key)
    love.mouse.keysReleased[key] = true
end

function love.mouse.wasPressed(key)
    return love.mouse.keysPressed[key]
end

function love.mouse.wasReleased(key)
    return love.mouse.keysReleased[key]
end
