Class = require 'lib/class'
Event = require 'lib/knife.event'
push = require 'lib/push'
Timer = require 'lib/knife.timer'

require 'src/Util'
require 'src/Animation'

require 'src/constants'

require 'src/gui/Menu'
require 'src/gui/Panel'
require 'src/gui/ProgressBar'
require 'src/gui/Selection'
require 'src/gui/Textbox'

require 'src/StateMachine'
require 'src/states/BaseState'
require 'src/states/StateStack'

require 'src/states/game/StartState'
require 'src/states/game/PlayState'
require 'src/states/game/FadeInState'
require 'src/states/game/FadeOutState'
require 'src/states/game/GameOverState'
require 'src/states/game/YellowEndingState'
require 'src/states/game/PurpleEndingState'
require 'src/states/game/CreditsState'

require 'src/states/game-event/GameEventBaseState'
require 'src/states/game-event/GameEventPlannedState'
require 'src/states/game-event/GameEventEncounterState'
require 'src/states/game-event/GameEventProgressingState'
require 'src/states/game-event/GameEventResolveState'
require 'src/states/game-event/GameEventPassedState'

require 'src/states/game/BattleState'
require 'src/states/game/BattleMenuState'
require 'src/states/game/BattleMessageState'
require 'src/states/game/DialogueState'
require 'src/states/game/TakeTurnState'

-- require 'src/world/Level'
-- require 'src/world/tile_ids'
-- require 'src/world/Tile'
-- require 'src/world/TileMap'

require 'src/Side'
require 'src/facility/Facility'
require 'src/facility/facility_defs'
-- require 'src/states/facility/' -- TODO
-- require 'src/states/facility/' -- TODO
-- require 'src/states/facility/' -- TODO

-- require 'src/entity/Entity'
-- require 'src/entity/entity_defs'
-- require 'src/states/entity/EntityBaseState'
-- require 'src/states/entity/EntityIdleState'
-- require 'src/states/entity/EntityWalkState'


gTextures = {
    ['yellow'] = love.graphics.newImage('graphics/yellow.png'),
    ['purple'] = love.graphics.newImage('graphics/purple.png')
}

gFrames = {
    ['yellow'] = GenerateQuads(gTextures['yellow'], 48, 48),
    ['purple'] = GenerateQuads(gTextures['purple'], 48, 48)
}

gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 32)
}

gSounds = {
    ['field-music'] = love.audio.newSource('sounds/field_music.wav', 'stream'),
    ['battle-music'] = love.audio.newSource('sounds/battle_music.mp3', 'stream'),
    ['blip'] = love.audio.newSource('sounds/blip.wav', 'static'),
    ['powerup'] = love.audio.newSource('sounds/powerup.wav', 'static'),
    ['hit'] = love.audio.newSource('sounds/hit.wav', 'static'),
    ['run'] = love.audio.newSource('sounds/run.wav', 'static'),
    ['heal'] = love.audio.newSource('sounds/heal.wav', 'static'),
    ['exp'] = love.audio.newSource('sounds/exp.wav', 'static'),
    ['error'] = love.audio.newSource('sounds/error.wav', 'static'),
    ['levelup'] = love.audio.newSource('sounds/levelup.wav', 'static'),
    ['victory-music'] = love.audio.newSource('sounds/victory.wav', 'stream'),
    ['yellow-theme'] = love.audio.newSource('sounds/moon-gate.wav', 'stream'),
    ['purple-theme'] = love.audio.newSource('sounds/moon-gate.wav', 'stream'),
    ['main-theme'] = love.audio.newSource('sounds/intro.mp3', 'stream')
}
love.audio.setVolume(0.5)

-- ['main-theme'] = love.audio.newSource('sounds/main-theme.wav', 'static'),
