VIRTUAL_WIDTH = 614
VIRTUAL_HEIGHT = 345

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

FACILITY_SIZE = 48

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
YELLOW = table.pack(rgb(217, 186, 22))
YELLOW_UI_BG = table.pack(rgb(138, 119, 19))
PURPLE = table.pack(rgb(171, 42, 232))
PURPLE_UI_BG = table.pack(rgb(77, 14, 107))


gColours = {
    ['yellow'] = {
        main = YELLOW,
        ui_bg = YELLOW_UI_BG,
        ui_text = YELLOW_UI_TEXT
    },
    ['purple'] = {
        main = PURPLE,
        ui_bg = PURPLE_UI_BG,
        ui_text = PURPLE_UI_TEXT
    },
    ['general'] = {
        main = GREY,
        ui_bg = GREY_UI_BG,
        ui_text = GREY_UI_TEXT
    }
}


CHEAT_MODE = true
