PlayState = Class{__includes = BaseState}

function PlayState:init()

    gSounds['field-music']:setLooping(true)
    gSounds['field-music']:play()

end

function PlayState:update(dt)

end

function PlayState:render()

end
