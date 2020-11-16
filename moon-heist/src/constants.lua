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
    ['perception'] = 2000
}

ZERO_RESOURCES = {
    ['money'] = 0,
    ['food'] = 0,
    ['energy'] = 0,
    ['perception'] = 0
}

GREY = table.pack(rgb(136, 134, 138))
GREY_UI_BG = table.pack(rgb(78, 75, 83))
GREY_UI_TEXT = table.pack(rgb(190, 163, 165))
WHITE = table.pack(rgb(255, 255, 255))

YELLOW = table.pack(rgb(255, 216, 0))
YELLOW_UI_BG = table.pack(rgba(255, 216, 0, 0.9))
YELLOW_LIGHT = table.pack(rgb(252, 255, 197))
YELLOW_BG = table.pack(rgb(195, 180, 126))

PURPLE = table.pack(rgb(168, 0, 255))
PURPLE_UI_BG = table.pack(rgb(168, 0, 255, 0.9))
PURPLE_BG = table.pack(rgb(185, 126, 195))

gColours = {
    ['yellow'] = {
        main = YELLOW,
        bg = YELLOW_BG,
        ui_bg = YELLOW_UI_BG,
        ui_text = YELLOW_UI_TEXT
    },
    ['purple'] = {
        main = PURPLE,
        bg = PURPLE_BG,
        ui_bg = PURPLE_UI_BG,
        ui_text = PURPLE_UI_TEXT
    },
    ['general'] = {
        main = GREY,
        ui_bg = GREY_UI_BG,
        ui_text = GREY_UI_TEXT
    }
}

DEBUG = false

CHEAT_MODE = false
EVENTS_MODE = true
