ENTITY_DEFS = {
    ['yellow'] = {
        [1] = {
            x = 120,
            y = 40,
            width = 120,
            height = 120,
            animations = {
                ['idle-down'] = {
                    frames = {1, 2, 3, 4, 5, 6, 7, 8},
                    interval = 1.2,
                    texture = 'earth'
                }
            }
        }
    },
    ['purple'] = {
        [1] = {
            x = VIRTUAL_WIDTH - 300,
            y = -20,
            width = 120,
            height = 120,
            scale = 2,
            animations = {
                ['idle-down'] = {
                    frames = {1, 2, 3},
                    interval = 1.2,
                    texture = 'galaxy'
                }
            }
        }
    }
}
