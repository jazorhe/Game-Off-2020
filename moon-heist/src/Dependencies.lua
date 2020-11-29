Class = require 'lib/class'
Event = require 'lib/knife.event'
push = require 'lib/push'
Timer = require 'lib/knife.timer'

require 'src/Util'
require 'src/Animation'
require 'src/constants'

require 'src/gui/Menu'
require 'src/gui/Panel'
require 'src/gui/DisplayPanel'
require 'src/gui/ProgressBar'
require 'src/gui/Selection'
require 'src/gui/Textbox'
require 'src/gui/Button'

require 'src/StateMachine'
require 'src/states/BaseState'
require 'src/states/StateStack'

require 'src/states/game/StartState'
require 'src/states/game/PauseState'
require 'src/states/game/FadeInState'
require 'src/states/game/FadeOutState'
require 'src/states/game/PlayState'
require 'src/states/game/DialogueState'
require 'src/states/game/TutorialState'
require 'src/states/game/GameEventDisplayState'
require 'src/states/game/NewTurnTransitionState'
require 'src/states/game/GameOverState'
require 'src/states/game/YellowEndingState'
require 'src/states/game/PurpleEndingState'
require 'src/states/game/CreditsState'
require 'src/states/game/DebugOptionsState'

require 'src/Side'
require 'src/Sky'
require 'src/facility/Facility'
require 'src/entity/Entity'
require 'src/game-event/GameEvent'

require 'src/states/game/tutorial_defs'
require 'src/facility/facility_defs'
require 'src/entity/entity_defs'
require 'src/game-event/gameevent_defs'

require 'src/states/entity/EntityBaseState'
require 'src/states/entity/EntityIdleState'
require 'src/states/entity/EntityWalkState'
require 'src/states/game-event/GameEventBaseState'
require 'src/states/game-event/GameEventPlannedState'
require 'src/states/game-event/GameEventEncounterState'
require 'src/states/game-event/GameEventProgressingState'
require 'src/states/game-event/GameEventResolveState'
require 'src/states/game-event/GameEventPassedState'

gTextures = {
    ['yellow'] = love.graphics.newImage('graphics/yellow.png'),
    ['yellow6'] = love.graphics.newImage('graphics/yellow6.png'),
    ['yellow-logo'] = love.graphics.newImage('graphics/yellow-logo.png'),
    ['purple'] = love.graphics.newImage('graphics/purple.png'),
    ['purple6'] = love.graphics.newImage('graphics/purple6.png'),
    ['purple-logo'] = love.graphics.newImage('graphics/purple-logo.png'),
    ['cursor'] = love.graphics.newImage('graphics/cursor.png'),
    ['yellowbg'] = love.graphics.newImage('graphics/yellow-background.png'),
    ['purplebg'] = love.graphics.newImage('graphics/purple-background.png'),
    ['earth'] = love.graphics.newImage('graphics/earth.png'),
    ['galaxy'] = love.graphics.newImage('graphics/galaxy.png'),
    ['particle'] = love.graphics.newImage('graphics/particle.png'),
    ['credit-jazor'] = love.graphics.newImage('graphics/credit-jazorhe.png'),
    ['credit-rhoda'] = love.graphics.newImage('graphics/credit-rhodadu.png'),
    ['credit-tooth'] = love.graphics.newImage('graphics/credit-toothless.png'),
    ['credit-adam'] = love.graphics.newImage('graphics/credit-adamchen.png'),
    ['credit-olivia'] = love.graphics.newImage('graphics/credit-olivia.png')
}

gFrames = {
    ['yellow'] = GenerateQuads(gTextures['yellow'], 48, 48),
    ['yellow6'] = GenerateQuads(gTextures['yellow6'], 144, 96),
    ['purple'] = GenerateQuads(gTextures['purple'], 48, 48),
    ['purple6'] = GenerateQuads(gTextures['purple6'], 182, 288),
    ['earth'] = GenerateQuads(gTextures['earth'], 120, 120),
    ['galaxy'] = GenerateQuads(gTextures['galaxy'], 120, 120)
}

gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['dialogue'] = love.graphics.newFont('fonts/font.ttf', 12),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 32),
    ['huge'] = love.graphics.newFont('fonts/font.ttf', 64)
}

gSounds = {
    ['blip'] = love.audio.newSource('sounds/blip.wav', 'static'),
    ['bell'] = love.audio.newSource('sounds/bell.wav', 'static'),
    ['error'] = love.audio.newSource('sounds/error.wav', 'static'),
    ['levelup'] = love.audio.newSource('sounds/levelup.wav', 'static'),
    ['main-theme'] = love.audio.newSource('sounds/moon-theme.mp3', 'stream'),
    ['yellow-theme'] = love.audio.newSource('sounds/moon-gate.wav', 'stream'),
    ['purple-theme'] = love.audio.newSource('sounds/moon-gate-dark.mp3','stream'),
    ['victory-theme'] = love.audio.newSource('sounds/moon-victory.mp3','stream')
}
gVolume = 0.8
gMute = false
love.audio.setVolume(gVolume)
gSounds['blip']:setVolume(0.5)
