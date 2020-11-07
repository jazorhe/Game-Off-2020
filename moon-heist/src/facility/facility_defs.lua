FACILITY_DEFS = {
    ['yellow'] = {
        [1] = {
            type = 'generator',
            side = 'yellow',
            initLevel = 1,
            mapX = 3,
            mapY = 1,
            renderLayer = 4,
            offsetX = nil,
            offsetY = nil,

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
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-1'] = {
                    frames = {1, 2, 3, 4, 5, 6},
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-2'] = {
                    frames = {8, 9, 10, 11, 12, 13},
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-3'] = {
                    frames = {15, 16, 17, 18, 19, 20},
                    interval = 0.2,
                    texture = 'yellow'
                }
            }
        },
        [2] = {
            type = 'farm',
            side = 'yellow',
            initLevel = 0,
            mapX = 2,
            mapY = 1,
            renderLayer = 5,
            offsetX = nil,
            offsetY = nil,

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
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-1'] = {
                    frames = {22, 23, 24, 25, 26, 27},
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-2'] = {
                    frames = {29, 30, 31, 32, 33, 34},
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-3'] = {
                    frames = {36, 37, 38, 39, 40, 41},
                    interval = 0.2,
                    texture = 'yellow'
                }
            }
        },
        [3] = {
            type = 'weather-station',
            side = 'yellow',
            initLevel = 0,
            mapX = 1,
            mapY = 1,
            renderLayer = 6,
            offsetX = nil,
            offsetY = nil,

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
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-1'] = {
                    frames = {43, 44, 45, 46, 47, 48},
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-2'] = {
                    frames = {50, 51, 52, 53, 54, 55},
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-3'] = {
                    frames = {57, 58, 59, 60, 61, 62},
                    interval = 0.2,
                    texture = 'yellow'
                }
            }
        },
        [4] = {
            type = 'tunnel',
            side = 'yellow',
            initLevel = 0,
            mapX = 3,
            mapY = 2,
            renderLayer = 1,
            offsetX = nil,
            offsetY = nil,

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
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-1'] = {
                    frames = {64, 65, 66, 67, 68, 69},
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-2'] = {
                    frames = {71, 72, 73, 74, 75, 76},
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-3'] = {
                    frames = {78, 79, 80, 81, 82, 83},
                    interval = 0.2,
                    texture = 'yellow'
                }
            }
        },
        [5] = {
            type = 'apartment',
            side = 'yellow',
            initLevel = 0,
            mapX = 2,
            mapY = 2,
            renderLayer = 2,
            offsetX = nil,
            offsetY = nil,

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
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-1'] = {
                    frames = {85, 86, 87, 88, 89, 90},
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-2'] = {
                    frames = {92, 93, 94, 95, 96, 97},
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-3'] = {
                    frames = {99, 100, 101, 102, 103, 104},
                    interval = 0.2,
                    texture = 'yellow'
                }
            }
        },
        [6] = {
            type = 'habour',
            side = 'yellow',
            initLevel = 0,
            mapX = 1,
            mapY = 2,
            renderLayer = 3,
            offsetX = nil,
            offsetY = nil,

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
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-1'] = {
                    frames = {106, 107, 108, 109, 110, 111},
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-2'] = {
                    frames = {113, 114, 115, 116, 117, 118},
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-3'] = {
                    frames = {120, 121, 122, 123, 124, 125},
                    interval = 0.2,
                    texture = 'yellow'
                }
            }
        }
    },
    ['purple'] = {
        [1] = {
            type = 'lab',
            side = 'purple',
            initLevel = 1,
            mapX = 1,
            mapY = 1,
            renderLayer = 4,
            offsetX = nil,
            offsetY = nil,

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
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-1'] = {
                    frames = {1, 2, 3, 4, 5, 6},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-2'] = {
                    frames = {8, 9, 10, 11, 12, 13},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-3'] = {
                    frames = {15, 16, 17, 18, 19, 20},
                    interval = 0.2,
                    texture = 'purple'
                }
            }
        },
        [2] = {
            type = 'mine',
            side = 'purple',
            initLevel = 0,
            mapX = 2,
            mapY = 1,
            renderLayer = 5,
            offsetX = nil,
            offsetY = nil,

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
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-1'] = {
                    frames = {22, 23, 24, 25, 26, 27},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-2'] = {
                    frames = {29, 30, 31, 32, 33, 34},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-3'] = {
                    frames = {36, 37, 38, 39, 40, 41},
                    interval = 0.2,
                    texture = 'purple'
                }
            }
        },
        [3] = {
            type = 'recycle-station',
            side = 'purple',
            initLevel = 0,
            mapX = 3,
            mapY = 1,
            renderLayer = 6,
            offsetX = nil,
            offsetY = nil,

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
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-1'] = {
                    frames = {43, 44, 45, 46, 47, 48},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-2'] = {
                    frames = {50, 51, 52, 53, 54, 55},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-3'] = {
                    frames = {57, 58, 59, 60, 61, 62},
                    interval = 0.2,
                    texture = 'purple'
                }
            }
        },
        [4] = {
            type = 'dark-matter',
            side = 'purple',
            initLevel = 0,
            mapX = 1,
            mapY = 2,
            renderLayer = 1,
            offsetX = nil,
            offsetY = nil,

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
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-1'] = {
                    frames = {64, 65, 66, 67, 68, 69},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-2'] = {
                    frames = {71, 72, 73, 74, 75, 76},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-3'] = {
                    frames = {78, 79, 80, 81, 82, 83},
                    interval = 0.2,
                    texture = 'purple'
                }
            }
        },
        [5] = {
            type = 'worm-hole',
            side = 'purple',
            initLevel = 0,
            mapX = 2,
            mapY = 2,
            renderLayer = 2,
            offsetX = nil,
            offsetY = nil,

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
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-1'] = {
                    frames = {85, 86, 87, 88, 89, 90},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-2'] = {
                    frames = {92, 93, 94, 95, 96, 97},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-3'] = {
                    frames = {99, 100, 101, 102, 103, 104},
                    interval = 0.2,
                    texture = 'purple'
                }
            }
        },
        [6] = {
            type = 'engine',
            side = 'purple',
            initLevel = 0,
            mapX = 3,
            mapY = 2,
            renderLayer = 3,
            offsetX = nil,
            offsetY = nil,

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
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-1'] = {
                    frames = {106, 107, 108, 109, 110, 111},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-2'] = {
                    frames = {113, 114, 115, 116, 117, 118},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-3'] = {
                    frames = {120, 121, 122, 123, 124, 125},
                    interval = 0.2,
                    texture = 'purple'
                }
            }
        }
    }
}
