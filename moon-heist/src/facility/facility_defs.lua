FACILITY_DEFS = {
    ['yellow'] = {
        [1] = {
            type = 'generator',
            side = 'yellow',

            buildCost = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['perception'] = 0
                },
                [1] = {
                    ['money'] = 100,
                    ['food'] = 100,
                    ['energy'] = 100,
                    ['perception'] = 100
                },
                [2] = {
                    ['money'] = 100,
                    ['food'] = 100,
                    ['energy'] = 100,
                    ['perception'] = 100
                },
                [3] = {
                    ['money'] = 100,
                    ['food'] = 100,
                    ['energy'] = 100,
                    ['perception'] = 100
                }
            },

            regCost = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['perception'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 50,
                    ['energy'] = 100,
                    ['perception'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 75,
                    ['energy'] = 120,
                    ['perception'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 100,
                    ['energy'] = 150,
                    ['perception'] = 0
                }
            },

            regEarn = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['perception'] = 0
                },
                [1] = {
                    ['money'] = 100,
                    ['food'] = 100,
                    ['energy'] = 100,
                    ['perception'] = 100
                },
                [2] = {
                    ['money'] = 100,
                    ['food'] = 100,
                    ['energy'] = 100,
                    ['perception'] = 100
                },
                [3] = {
                    ['money'] = 100,
                    ['food'] = 100,
                    ['energy'] = 100,
                    ['perception'] = 100
                }
            },

            animations = {
                ['idle-0'] = {
                    frames = {7},
                    interval = 0.02,
                    textures = 'yellow'
                },
                ['idle-1'] = {
                    frames = {1, 2, 3, 4, 5, 6},
                    interval = 0.02,
                    textures = 'yellow'
                },
                ['idle-2'] = {
                    frames = {8, 9, 10, 11, 12, 13},
                    interval = 0.02,
                    textures = 'yellow'
                },
                ['idle-3'] = {
                    frames = {8, 9, 10, 11, 12, 13},
                    interval = 0.02,
                    textures = 'yellow'
                }
            }
        },
        [2] = {},
        [3] = {},
        [4] = {},
        [5] = {},
        [6] = {}
    },
    ['purple'] = {
        [1] = {},
        [2] = {},
        [3] = {},
        [4] = {},
        [5] = {},
        [6] = {}
    }
}
