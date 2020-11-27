ROW_ONE_BASE_COST = {0, -200, -400, -600}
ROW_TWO_BASE_COST = {0, -350, -600, -800}
NO_SIX_BASE_COSTa = {0, -1000, -1600, -2400}
NO_SIX_BASE_COSTb = {0, -1000, -1600, -2400}

ROW_ONE_REG_COST = {0, -100, -120, -150}
ROW_TWO_REG_COSTa = {0, -350, -600, -800}
ROW_TWO_REG_COSTb = {0, -50, -75, -100}
NO_SIX_REG_COSTa = {0, -350, -600, -800}
NO_SIX_REG_COSTb = {0, -50, -75, -100}

ROW_ONE_REG_EARN = {0, 150, 350, 600}
ROW_TWO_REG_EARN = {0, 300, 550, 800}
NO_SIX_REG_EARN = {0, 300, 650, 1000}

SPECIAL_EARN = {0, 300, 500, 800}

FACILITY_DEFS = {
    ['yellow'] = {
        [1] = {
            type = 'generator',
            name = 'Nuclear Power Plant',
            side = 'yellow',
            scale = 2,
            initLevel = 1,
            mapX = 3,
            mapY = 2,
            renderLayer = 1,
            -- offsetX = VIRTUAL_WIDTH - 4.5 * FACILITY_SIZE,
            -- offsetY = VIRTUAL_HEIGHT / 5 * 3,

            buildCost = {
                [0] = {
                    ['money'] = ROW_ONE_BASE_COST[1],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = ROW_ONE_BASE_COST[2],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = ROW_ONE_BASE_COST[3],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = ROW_ONE_BASE_COST[4],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            downGradeEarn = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            regCost = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = ROW_ONE_REG_COST[1],
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = ROW_ONE_REG_COST[2],
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = ROW_ONE_REG_COST[3],
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = ROW_ONE_REG_COST[4],
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            regEarn = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = SPECIAL_EARN[1],
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = SPECIAL_EARN[2],
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = SPECIAL_EARN[3],
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = SPECIAL_EARN[4],
                    ['amenity'] = 0
                }
            },

            animations = {
                ['idle-0'] = {
                    frames = {14},
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-1'] = {
                    frames = {1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6},
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-2'] = {
                    frames = {8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13},
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-3'] = {
                    frames = {15, 15, 16, 16, 17, 17, 18, 18, 19, 19, 20, 20},
                    interval = 0.2,
                    texture = 'yellow'
                }
            }
        },

        [2] = {
            type = 'farm',
            name = 'Lunar Farm',
            side = 'yellow',
            scale = 2,
            initLevel = 0,
            mapX = 2,
            mapY = 2,
            renderLayer = 2,
            -- offsetX = VIRTUAL_WIDTH - 4.5 * FACILITY_SIZE - 20,
            -- offsetY = VIRTUAL_HEIGHT / 5 * 3,

            buildCost = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = ROW_ONE_BASE_COST[1]
                },
                [1] = {
                    ['money'] =0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = ROW_ONE_BASE_COST[2]
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = ROW_ONE_BASE_COST[3]
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = ROW_ONE_BASE_COST[4]
                }
            },

            downGradeEarn = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            regCost = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = ROW_ONE_REG_COST[1],
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = ROW_ONE_REG_COST[2],
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = ROW_ONE_REG_COST[3],
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = ROW_ONE_REG_COST[4],
                    ['amenity'] = 0
                }
            },

            regEarn = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = SPECIAL_EARN[1],
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = SPECIAL_EARN[2],
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = SPECIAL_EARN[3],
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = SPECIAL_EARN[4],
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            animations = {
                ['idle-0'] = {
                    frames = {14},
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-1'] = {
                    frames = {22, 22, 23, 23, 24, 24,
                              25, 25, 26, 26, 27, 27},
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-2'] = {
                    frames = {29, 29, 30, 30, 31, 31,
                              32, 32, 33, 33, 34, 34},
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-3'] = {
                    frames = {36, 36, 37, 37, 38, 38,
                              39, 39, 40, 40, 41, 41},
                    interval = 0.2,
                    texture = 'yellow'
                }
            }
        },

        [3] = {
            type = 'weather-station',
            name = 'Weather Station',
            side = 'yellow',
            scale = 2,
            initLevel = 0,
            mapX = 1,
            mapY = 2,
            renderLayer = 3,
            -- offsetX = VIRTUAL_WIDTH - 4.5 * FACILITY_SIZE - 40,
            -- offsetY = VIRTUAL_HEIGHT / 5 * 3,

            buildCost = {
                [0] = {
                    ['money'] = ROW_ONE_BASE_COST[1],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = ROW_ONE_BASE_COST[2],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = ROW_ONE_BASE_COST[3],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = ROW_ONE_BASE_COST[4],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            downGradeEarn = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            regCost = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = ROW_ONE_REG_COST[1],
                    ['energy'] = ROW_ONE_REG_COST[1],
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = ROW_ONE_REG_COST[2],
                    ['energy'] = ROW_ONE_REG_COST[2],
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = ROW_ONE_REG_COST[3],
                    ['energy'] = ROW_ONE_REG_COST[3],
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = ROW_ONE_REG_COST[4],
                    ['energy'] = ROW_ONE_REG_COST[4],
                    ['amenity'] = 0
                }
            },

            regEarn = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = ROW_ONE_REG_EARN[1]
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = ROW_ONE_REG_EARN[2]
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = ROW_ONE_REG_EARN[3]
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = ROW_ONE_REG_EARN[4]
                }
            },

            animations = {
                ['idle-0'] = {
                    frames = {14},
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-1'] = {
                    -- frames = {43, 43, 43, 43, 44, 44, 44, 44, 45, 46, 47, 47, 47, 47, 48, 48, 48, 48, 46, 45},
                    frames = {43, 43, 44, 44, 45, 46, 47, 47, 48, 48, 46, 45},
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-2'] = {
                    frames = {50, 50, 51, 51, 52, 53, 54, 54, 55, 55, 53, 52},
                    interval = 0.2,
                    texture = 'yellow'
                },
                ['idle-3'] = {
                    frames = {57, 57, 57, 58, 58, 58, 59, 59, 59,
                    60, 60, 60, 61, 61, 61, 62, 62, 62},
                    interval = 0.2,
                    texture = 'yellow'
                }
            }
        },

        [4] = {
            type = 'dark-matter',
            name = 'Dark Matter Detector',
            side = 'yellow',
            scale = 2,
            initLevel = 0,
            mapX = 3,
            mapY = 1,
            renderLayer = 4,
            -- offsetX = VIRTUAL_WIDTH - 4.5 * FACILITY_SIZE - 30,
            -- offsetY = VIRTUAL_HEIGHT / 5 * 3 + 4,

            buildCost = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = ROW_TWO_REG_COSTa[1],
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = ROW_TWO_REG_COSTa[2],
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = ROW_TWO_REG_COSTa[3],
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = ROW_TWO_REG_COSTa[4],
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            downGradeEarn = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            regCost = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = ROW_ONE_REG_COST[1],
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = ROW_ONE_REG_COST[2],
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = ROW_ONE_REG_COST[3],
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 00,
                    ['energy'] = ROW_ONE_REG_COST[4],
                    ['amenity'] = 0
                }
            },

            regEarn = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = SPECIAL_EARN[1],
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = SPECIAL_EARN[2],
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = SPECIAL_EARN[3],
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = SPECIAL_EARN[4],
                    ['amenity'] = 0
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
            name = 'Lunar Apartment',
            side = 'yellow',
            scale = 2,
            initLevel = 0,
            mapX = 2,
            mapY = 1,
            renderLayer = 5,
            -- offsetX = VIRTUAL_WIDTH - 4.5 * FACILITY_SIZE - 50,
            -- offsetY = VIRTUAL_HEIGHT / 5 * 3 + 4,

            buildCost = {
                [0] = {
                    ['money'] = ROW_TWO_BASE_COST[1],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = ROW_TWO_BASE_COST[2],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = ROW_TWO_BASE_COST[3],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = ROW_TWO_BASE_COST[4],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            downGradeEarn = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            regCost = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = ROW_TWO_REG_COSTa[1],
                    ['energy'] = ROW_TWO_REG_COSTb[1],
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = ROW_TWO_REG_COSTa[2],
                    ['energy'] = ROW_TWO_REG_COSTb[2],
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = ROW_TWO_REG_COSTa[3],
                    ['energy'] = ROW_TWO_REG_COSTb[3],
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = ROW_TWO_REG_COSTa[4],
                    ['energy'] = ROW_TWO_REG_COSTb[4],
                    ['amenity'] = 0
                }
            },

            regEarn = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = ROW_TWO_REG_EARN[1]
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = ROW_TWO_REG_EARN[2]
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = ROW_TWO_REG_EARN[3]
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = ROW_TWO_REG_EARN[4]
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
            type = 'harbour',
            name = 'Space Harbour',
            side = 'yellow',
            scale = 2,
            initLevel = 0,
            mapX = 1,
            mapY = 1,
            renderLayer = 6,
            width = 144,
            height = 96,
            -- offsetX = VIRTUAL_WIDTH - 4.5 * FACILITY_SIZE - 70,
            -- offsetY = VIRTUAL_HEIGHT / 5 * 3 + 4,

            buildCost = {
                [0] = {
                    ['money'] = NO_SIX_BASE_COSTa[1],
                    ['food'] = NO_SIX_BASE_COSTb[1],
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = NO_SIX_BASE_COSTa[2],
                    ['food'] = NO_SIX_BASE_COSTb[2],
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = NO_SIX_BASE_COSTa[3],
                    ['food'] = NO_SIX_BASE_COSTb[3],
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = NO_SIX_BASE_COSTa[4],
                    ['food'] = NO_SIX_BASE_COSTb[4],
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            downGradeEarn = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            regCost = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = NO_SIX_REG_COSTa[1],
                    ['energy'] = NO_SIX_REG_COSTb[1],
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = NO_SIX_REG_COSTa[2],
                    ['energy'] = NO_SIX_REG_COSTb[2],
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = NO_SIX_REG_COSTa[3],
                    ['energy'] = NO_SIX_REG_COSTb[3],
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = NO_SIX_REG_COSTa[4],
                    ['energy'] = NO_SIX_REG_COSTb[4],
                    ['amenity'] = 0
                }
            },

            regEarn = {
                [0] = {
                    ['money'] = NO_SIX_REG_EARN[1],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = NO_SIX_REG_EARN[2],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = NO_SIX_REG_EARN[3],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = NO_SIX_REG_EARN[4],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            animations = {
                ['idle-0'] = {
                    frames = {7},
                    interval = 0.2,
                    texture = 'yellow6'
                },
                ['idle-1'] = {
                    frames = {1, 2, 3, 4, 5, 6, 6,
                              6, 5, 4, 3, 2, 1, 1},
                    interval = 0.2,
                    texture = 'yellow6'
                },
                ['idle-2'] = {
                    frames = {8, 9, 10, 11, 12, 13, 13,
                              13, 12, 11, 10, 9, 8, 8},
                    interval = 0.2,
                    texture = 'yellow6'
                },
                ['idle-3'] = {
                    frames = {15, 16, 17, 18, 19, 20, 20,
                              20, 19, 18, 17, 16, 15, 15},
                    interval = 0.2,
                    texture = 'yellow6'
                }
            }
        }
    },
    ['purple'] = {
        [1] = {
            type = 'lab',
            name = 'Dark Lab',
            side = 'purple',
            scale = 2,
            initLevel = 1,
            mapX = 1,
            mapY = 2,
            renderLayer = 1,
            -- offsetX = 1 * FACILITY_SIZE,
            -- offsetY = VIRTUAL_HEIGHT / 5 * 3 - 30,

            buildCost = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = ROW_ONE_BASE_COST[1],
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = ROW_ONE_BASE_COST[2],
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = ROW_ONE_BASE_COST[3],
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = ROW_ONE_BASE_COST[4],
                    ['amenity'] = 0
                }
            },

            downGradeEarn = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            regCost = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = ROW_ONE_REG_COST[1],
                    ['energy'] = ROW_ONE_REG_COST[1],
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = ROW_ONE_REG_COST[2],
                    ['energy'] = ROW_ONE_REG_COST[2],
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = ROW_ONE_REG_COST[3],
                    ['energy'] = ROW_ONE_REG_COST[3],
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = ROW_ONE_REG_COST[4],
                    ['energy'] = ROW_ONE_REG_COST[4],
                    ['amenity'] = 0
                }
            },

            regEarn = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = ROW_ONE_REG_EARN[1]
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = ROW_ONE_REG_EARN[2]
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = ROW_ONE_REG_EARN[3]
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = ROW_ONE_REG_EARN[4]
                }
            },

            animations = {
                ['idle-0'] = {
                    frames = {14},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-1'] = {
                    frames = {1},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-2'] = {
                    frames = {8},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-3'] = {
                    frames = {15},
                    interval = 0.2,
                    texture = 'purple'
                }
            }
        },

        [2] = {
            type = 'drill',
            name = 'Surface Drill',
            side = 'purple',
            scale = 2,
            initLevel = 0,
            mapX = 2,
            mapY = 2,
            renderLayer = 2,
            -- offsetX = 1 * FACILITY_SIZE + 48,
            -- offsetY = VIRTUAL_HEIGHT / 5 * 3 - 30,

            buildCost = {
                [0] = {
                    ['money'] = ROW_ONE_BASE_COST[1],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = ROW_ONE_BASE_COST[2],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = ROW_ONE_BASE_COST[3],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = ROW_ONE_BASE_COST[4],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            downGradeEarn = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            regCost = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = ROW_ONE_REG_COST[1],
                    ['energy'] = ROW_ONE_REG_COST[1],
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = ROW_ONE_REG_COST[2],
                    ['energy'] = ROW_ONE_REG_COST[2],
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = ROW_ONE_REG_COST[3],
                    ['energy'] = ROW_ONE_REG_COST[3],
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = ROW_ONE_REG_COST[4],
                    ['energy'] = ROW_ONE_REG_COST[4],
                    ['amenity'] = 0
                }
            },

            regEarn = {
                [0] = {
                    ['money'] = ROW_ONE_REG_EARN[1],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = ROW_ONE_REG_EARN[2],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = ROW_ONE_REG_EARN[3],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = ROW_ONE_REG_EARN[4],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            animations = {
                ['idle-0'] = {
                    frames = {14},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-1'] = {
                    frames = {22},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-2'] = {
                    frames = {29},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-3'] = {
                    frames = {36},
                    interval = 0.2,
                    texture = 'purple'
                }
            }
        },

        [3] = {
            type = 'vivarium-tank',
            name = 'Vivarium Tank',
            side = 'purple',
            scale = 2,
            initLevel = 0,
            mapX = 3,
            mapY = 2,
            renderLayer = 3,
            -- offsetX = 1 * FACILITY_SIZE + 96,
            -- offsetY = VIRTUAL_HEIGHT / 5 * 3 - 30,

            buildCost = {
                [0] = {
                    ['money'] = ROW_ONE_BASE_COST[1],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = ROW_ONE_BASE_COST[2],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = ROW_ONE_BASE_COST[3],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = ROW_ONE_BASE_COST[4],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            downGradeEarn = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            regCost = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = ROW_ONE_REG_COST[1],
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = ROW_ONE_REG_COST[2],
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = ROW_ONE_REG_COST[3],
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = ROW_ONE_REG_COST[4],
                    ['amenity'] = 0
                }
            },

            regEarn = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = SPECIAL_EARN[1],
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = SPECIAL_EARN[2],
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = SPECIAL_EARN[3],
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = SPECIAL_EARN[4],
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            animations = {
                ['idle-0'] = {
                    frames = {14},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-1'] = {
                    frames = {43},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-2'] = {
                    frames = {50},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-3'] = {
                    frames = {57},
                    interval = 0.2,
                    texture = 'purple'
                }
            }
        },

        [4] = {
            type = 'photosynthesis-exchange',
            name = 'Photosynthesis Exchange',
            side = 'purple',
            scale = 2,
            initLevel = 0,
            mapX = 1,
            mapY = 1,
            renderLayer = 4,
            -- offsetX = 1 * FACILITY_SIZE,
            -- offsetY = VIRTUAL_HEIGHT / 5 * 3 + 18,

            buildCost = {
                [0] = {
                    ['money'] = ROW_TWO_BASE_COST[1],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = ROW_TWO_BASE_COST[2],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = ROW_TWO_BASE_COST[3],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = ROW_TWO_BASE_COST[4],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            downGradeEarn = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            regCost = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = ROW_TWO_REG_COSTa[1],
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = ROW_TWO_REG_COSTa[2],
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = ROW_TWO_REG_COSTa[3],
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = ROW_TWO_REG_COSTa[4],
                    ['amenity'] = 0
                }
            },

            regEarn = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = ROW_TWO_REG_EARN[1],
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = ROW_TWO_REG_EARN[2],
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = ROW_TWO_REG_EARN[3],
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = ROW_TWO_REG_EARN[4],
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            animations = {
                ['idle-0'] = {
                    frames = {14},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-1'] = {
                    frames = {64},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-2'] = {
                    frames = {71},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-3'] = {
                    frames = {78},
                    interval = 0.2,
                    texture = 'purple'
                }
            }
        },

        [5] = {
            type = 'gravity-well',
            name = 'Gravity Well',
            side = 'purple',
            scale = 2,
            initLevel = 0,
            mapX = 2,
            mapY = 1,
            renderLayer = 5,
            -- offsetX = 1 * FACILITY_SIZE + 48,
            -- offsetY = VIRTUAL_HEIGHT / 5 * 3 + 18,

            buildCost = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = ROW_TWO_BASE_COST[1],
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = ROW_TWO_BASE_COST[2],
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = ROW_TWO_BASE_COST[3],
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = ROW_TWO_BASE_COST[4],
                    ['amenity'] = 0
                }
            },

            downGradeEarn = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            regCost = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = ROW_TWO_REG_COSTb[1],
                    ['energy'] = ROW_TWO_REG_COSTa[1],
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = ROW_TWO_REG_COSTb[2],
                    ['energy'] = ROW_TWO_REG_COSTa[2],
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = ROW_TWO_REG_COSTb[3],
                    ['energy'] = ROW_TWO_REG_COSTa[3],
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = ROW_TWO_REG_COSTb[4],
                    ['energy'] = ROW_TWO_REG_COSTa[4],
                    ['amenity'] = 0
                }
            },

            regEarn = {
                [0] = {
                    ['money'] = ROW_TWO_REG_EARN[1],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = ROW_TWO_REG_EARN[2],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = ROW_TWO_REG_EARN[3],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = ROW_TWO_REG_EARN[4],
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            animations = {
                ['idle-0'] = {
                    frames = {14},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-1'] = {
                    frames = {85},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-2'] = {
                    frames = {92},
                    interval = 0.2,
                    texture = 'purple'
                },
                ['idle-3'] = {
                    frames = {99},
                    interval = 0.2,
                    texture = 'purple'
                }
            }
        },

        [6] = {
            type = 'sail',
            name = 'Photon Sail',
            side = 'purple',
            scale = 1,
            initLevel = 0,
            mapX = 3,
            mapY = 1,
            renderLayer = 6,
            -- offsetX = 1 * FACILITY_SIZE + 96,
            -- offsetY = VIRTUAL_HEIGHT / 5 * 3 + 18,

            buildCost = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = NO_SIX_BASE_COSTb[1],
                    ['amenity'] = NO_SIX_BASE_COSTa[1]
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = NO_SIX_BASE_COSTb[2],
                    ['amenity'] = NO_SIX_BASE_COSTa[2]
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = NO_SIX_BASE_COSTb[3],
                    ['amenity'] = NO_SIX_BASE_COSTa[3]
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = NO_SIX_BASE_COSTb[4],
                    ['amenity'] = NO_SIX_BASE_COSTa[4]
                }
            },

            downGradeEarn = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = 0
                }
            },

            regCost = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = NO_SIX_REG_COSTb[1],
                    ['energy'] = NO_SIX_REG_COSTa[1],
                    ['amenity'] = 0
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = NO_SIX_REG_COSTb[2],
                    ['energy'] = NO_SIX_REG_COSTa[2],
                    ['amenity'] = 0
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = NO_SIX_REG_COSTb[3],
                    ['energy'] = NO_SIX_REG_COSTa[3],
                    ['amenity'] = 0
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = NO_SIX_REG_COSTb[4],
                    ['energy'] = NO_SIX_REG_COSTa[4],
                    ['amenity'] = 0
                }
            },

            regEarn = {
                [0] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = NO_SIX_REG_EARN[1]
                },
                [1] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = NO_SIX_REG_EARN[2]
                },
                [2] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = NO_SIX_REG_EARN[3]
                },
                [3] = {
                    ['money'] = 0,
                    ['food'] = 0,
                    ['energy'] = 0,
                    ['amenity'] = NO_SIX_REG_EARN[4]
                }
            },

            animations = {
                ['idle-0'] = {
                    frames = {1},
                    interval = 0.2,
                    texture = 'purple6'
                },
                ['idle-1'] = {
                    frames = {1},
                    interval = 0.2,
                    texture = 'purple6'
                },
                ['idle-2'] = {
                    frames = {1},
                    interval = 0.2,
                    texture = 'purple6'
                },
                ['idle-3'] = {
                    frames = {1},
                    interval = 0.2,
                    texture = 'purple6'
                }
            }
        }
    }
}
