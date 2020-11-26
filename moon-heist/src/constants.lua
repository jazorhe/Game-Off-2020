VIRTUAL_WIDTH = 640
VIRTUAL_HEIGHT = 360

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

FACILITY_SIZE = 48
SHIFTING_WIDTH = VIRTUAL_WIDTH + 200

MAX_TURN = 18

INITIAL_RESOURCES = {
    ['money'] = 2000,
    ['food'] = 2000,
    ['energy'] = 2000,
    ['amenity'] = 2000
}

ZERO_RESOURCES = {
    ['money'] = 0,
    ['food'] = 0,
    ['energy'] = 0,
    ['amenity'] = 0
}

WHITE = table.pack(rgb(255, 255, 255))
GREY = table.pack(rgb(136, 134, 138))
GREY_UI_BG = table.pack(rgb(78, 75, 83, 0.8))
GREY_UI_TEXT = table.pack(rgb(190, 163, 165))

YELLOW = table.pack(rgb(255, 216, 0))
YELLOW_BG = table.pack(rgb(195, 180, 126))
YELLOW_UI_BG = table.pack(rgba(255, 216, 0, 0.8))
YELLOW_TEXT = table.pack(rgb(252, 255, 197))
YELLOW_TEXT_SEC = table.pack(rgb(235, 240, 140))
YELLOW_DARK = table.pack(rgb(71, 60, 10))

PURPLE = table.pack(rgb(168, 0, 255))
PURPLE_BG = table.pack(rgb(185, 126, 195))
PURPLE_UI_BG = table.pack(rgba(168, 0, 255, 0.8))
PURPLE_TEXT = table.pack(rgb(213, 186, 218))
PURPLE_TEXT_SEC = table.pack(rgb(185, 126, 195))
PURPLE_DARK = table.pack(rgb(34, 7, 40))

GENERAL = table.pack(rgb(255, 255, 255))
GENERAL_BG = table.pack(rgb(136, 134, 138))
GENERAL_UI_BG = table.pack(rgba(78, 75, 83, 0.8))
GENERAL_TEXT = table.pack(rgb(213, 213, 213))
GENERAL_DARK = table.pack(rgb(36, 31, 31))

GREEN = table.pack(rgb(67, 167, 67))
RED = table.pack(rgb(182, 36, 36))

gColours = {
    ['yellow'] = {
        main = YELLOW,
        bg = YELLOW_BG,
        ui_bg = YELLOW_UI_BG,
        ui_text = YELLOW_TEXT,
        ui_text_light = YELLOW_TEXT_SEC,
        dark = YELLOW_DARK
    },
    ['purple'] = {
        main = PURPLE,
        bg = PURPLE_BG,
        ui_bg = PURPLE_UI_BG,
        ui_text = PURPLE_TEXT,
        ui_text_light = PURPLE_TEXT_SEC,
        dark = PURPLE_DARK
    },
    ['general'] = {
        main = GENERAL,
        bg = GENERAL_BG,
        ui_bg = GENERAL_UI_BG,
        ui_text = GENERAL_TEXT,
        dark = GENERAL_DARK
    }
}

DEBUG = false
CHEAT_MODE = true

DEBUG_MOUSE = false
DEBUG_FACILITY = false
DEBUG_STATES = false

DEBUG_EVENTS = false
DEBUG_TESTEVENT = false
SKIP_EVENTS = false
