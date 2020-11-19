REGULAR_EVENTS = {}

RANDOM_EVENTS = {
    ['early'] = {
        [1] = {
            name = 'two-pills',
            side = 'general',
            type = 'random',
            group = 'early',
            encounter = 3,
            resolve = 3,
            eventID = 101,
            dialogues = {
                [0] = {
                    "There were two pills on your lunch plate today. \nYou were puzzled, and asked around if anyone knew where they might come from. \n\nNo one seemed to have any idea."
                },
                [1] = {
                    "You felt that the Red Pill is burning inside your stomach. You could not help but to stop your work and head to bed. You woke up the next day, your bird was dead."
                },
                [2] = {
                    "There seemed to be a moment of peace. The Blue Pill might afterall have no effect at all. You smiled wildly."
                },
                [3] = {
                    "Now, please continue with your duty."
                }
            },
            selections = {
                ['seleciton-prompt'] = "CHOOSE YOUR FATE:",
                [1] = {
                    text = "Red Pill...",
                    closing = "As you swallowed the Red Pill, you felt a presence haunting right behind you. You quickly turned around, but there was No ONE.",
                    onSelect = function()
                        return 1
                    end
                },
                [2] = {
                    text = "Blue Pill!",
                    closing = "You stared at the Blue Pill for a while. And suddenly, you reached out for it and took it down your throat, so quickly that you questioned yourself if it was your own decidsion.",
                    onSelect = function()
                        return 2
                    end
                },
            },
            outcomes = {
                [1] = math.random(100) <= 33 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 200,
                        ['perception'] = 400
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = -200,
                        ['perception'] = -400
                    },
                    trust = 0,
                    side = 'yellow'
                },
                [2] = math.random(100) <= 80 and {
                    resources = {
                        ['money'] = 1,
                        ['food'] = 1,
                        ['energy'] = 1,
                        ['perception'] = 1
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 200,
                        ['perception'] = 400
                    },
                    trust = 0,
                    side = 'yellow'
                }
            },
            sprites = {

            },
            gameEventFunctions = {
                funcName = function() end
            }
        },
        [2] = {
            name = 'no-name',
            side = 'general',
            type = 'random',
            group = 'early',
            encounter = 6,
            resolve = 6,
            eventID = 102,
            dialogues = {
                [0] = {
                    "The event is a placeholder for an early event, eventID 102"
                },
                [1] = {
                    "You selected option 1 in event 102, there is a 66% chance you will lose 200 energy and 400 perception. 33% of gaining them."
                },
                [2] = {
                    "You selected option 2 in event 102, there is 80% chance of no effect or 20% of losing 20% trust from yellow side."
                },
                [3] = {
                    "Now, please continue with your duty."
                }
            },
            selections = {
                ['seleciton-prompt'] = "EventID 102 selections: ",
                [1] = {
                    text = "1",
                    closing = "You have selected option 1",
                    onSelect = function()
                        return 1
                    end
                },
                [2] = {
                    text = "2",
                    closing = "You have selected option 2",
                    onSelect = function()
                        return 2
                    end
                },
            },
            outcomes = {
                [1] = math.random(100) <= 33 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 200,
                        ['perception'] = 400
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = -200,
                        ['perception'] = -400
                    },
                    trust = 0,
                    side = 'yellow'
                },
                [2] = math.random(100) <= 80 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['perception'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['perception'] = 0
                    },
                    trust = -20,
                    side = 'yellow'
                }
            },
            sprites = {

            },
            gameEventFunctions = {
                funcName = function() end
            }
        },
        [3] = {
            name = 'no-name',
            side = 'yellow',
            type = 'random',
            group = 'early',
            encounter = 5,
            resolve = 5,
            eventID = 103,
            dialogues = {
                [0] = {
                    "The event is a placeholder for an early event, eventID 103"
                },
                [1] = {
                    "You selected option 1 in event 103, there is a 66% chance you will lose 200 energy and 400 perception. 33% of gaining them."
                },
                [2] = {
                    "You selected option 2 in event 103, there is 80% chance of no effect or 20% of losing 20% trust from yellow side."
                },
                [3] = {
                    "Now, please continue with your duty."
                }
            },
            selections = {
                ['seleciton-prompt'] = "EventID 103 selections: ",
                [1] = {
                    text = "1",
                    closing = "You have selected option 1",
                    onSelect = function()
                        return 1
                    end
                },
                [2] = {
                    text = "2",
                    closing = "You have selected option 2",
                    onSelect = function()
                        return 2
                    end
                },
            },
            outcomes = {
                [1] = math.random(100) <= 33 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 200,
                        ['perception'] = 400
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = -200,
                        ['perception'] = -400
                    },
                    trust = 0,
                    side = 'yellow'
                },
                [2] = math.random(100) <= 80 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['perception'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['perception'] = 0
                    },
                    trust = -20,
                    side = 'yellow'
                }
            },
            sprites = {

            },
            gameEventFunctions = {
                funcName = function() end
            }
        },
        [4] = {
            name = 'no-name',
            side = 'yellow',
            type = 'random',
            group = 'early',
            encounter = 7,
            resolve = 7,
            eventID = 104,
            dialogues = {
                [0] = {
                    "The event is a placeholder for an early event, eventID 104"
                },
                [1] = {
                    "You selected option 1 in event 104, there is a 66% chance you will lose 200 energy and 400 perception. 33% of gaining them."
                },
                [2] = {
                    "You selected option 2 in event 104, there is 80% chance of no effect or 20% of losing 20% trust from yellow side."
                },
                [3] = {
                    "Now, please continue with your duty."
                }
            },
            selections = {
                ['seleciton-prompt'] = "EventID 104 selections: ",
                [1] = {
                    text = "1",
                    closing = "You have selected option 1",
                    onSelect = function()
                        return 1
                    end
                },
                [2] = {
                    text = "2",
                    closing = "You have selected option 2",
                    onSelect = function()
                        return 2
                    end
                },
            },
            outcomes = {
                [1] = math.random(100) <= 33 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 200,
                        ['perception'] = 400
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = -200,
                        ['perception'] = -400
                    },
                    trust = 0,
                    side = 'yellow'
                },
                [2] = math.random(100) <= 80 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['perception'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['perception'] = 0
                    },
                    trust = -20,
                    side = 'yellow'
                }
            },
            sprites = {

            },
            gameEventFunctions = {
                funcName = function() end
            }
        },
        [5] = {
            name = 'no-name',
            side = 'purple',
            type = 'random',
            group = 'early',
            encounter = 5,
            resolve = 5,
            eventID = 105,
            dialogues = {
                [0] = {
                    "The event is a placeholder for an early event, eventID 105"
                },
                [1] = {
                    "You selected option 1 in event 105, there is a 66% chance you will lose 200 energy and 400 perception. 33% of gaining them."
                },
                [2] = {
                    "You selected option 2 in event 105, there is 80% chance of no effect or 20% of losing 20% trust from yellow side."
                },
                [3] = {
                    "Now, please continue with your duty."
                }
            },
            selections = {
                ['seleciton-prompt'] = "EventID 105 selections: ",
                [1] = {
                    text = "1",
                    closing = "You have selected option 1",
                    onSelect = function()
                        return 1
                    end
                },
                [2] = {
                    text = "2",
                    closing = "You have selected option 2",
                    onSelect = function()
                        return 2
                    end
                },
            },
            outcomes = {
                [1] = math.random(100) <= 33 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 200,
                        ['perception'] = 400
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = -200,
                        ['perception'] = -400
                    },
                    trust = 0,
                    side = 'yellow'
                },
                [2] = math.random(100) <= 80 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['perception'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['perception'] = 0
                    },
                    trust = -20,
                    side = 'yellow'
                }
            },
            sprites = {

            },
            gameEventFunctions = {
                funcName = function() end
            }
        },
        [6] = {
            name = 'no-name',
            side = 'purple',
            type = 'random',
            group = 'early',
            encounter = 7,
            resolve = 7,
            eventID = 106,
            dialogues = {
                [0] = {
                    "The event is a placeholder for an early event, eventID 106"
                },
                [1] = {
                    "You selected option 1 in event 106, there is a 66% chance you will lose 200 energy and 400 perception. 33% of gaining them."
                },
                [2] = {
                    "You selected option 2 in event 106, there is 80% chance of no effect or 20% of losing 20% trust from yellow side."
                },
                [3] = {
                    "Now, please continue with your duty."
                }
            },
            selections = {
                ['seleciton-prompt'] = "EventID 106 selections: ",
                [1] = {
                    text = "1",
                    closing = "You have selected option 1",
                    onSelect = function()
                        return 1
                    end
                },
                [2] = {
                    text = "2",
                    closing = "You have selected option 2",
                    onSelect = function()
                        return 2
                    end
                },
            },
            outcomes = {
                [1] = math.random(100) <= 33 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 200,
                        ['perception'] = 400
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = -200,
                        ['perception'] = -400
                    },
                    trust = 0,
                    side = 'yellow'
                },
                [2] = math.random(100) <= 80 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['perception'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['perception'] = 0
                    },
                    trust = -20,
                    side = 'yellow'
                }
            },
            sprites = {

            },
            gameEventFunctions = {
                funcName = function() end
            }
        }
    },
    ['later'] = {
        [1] = {
            name = 'no-name',
            side = 'general',
            type = 'random',
            group = 'later',
            encounter = 9,
            resolve = 9,
            eventID = 201,
            dialogues = {
                [0] = {
                    "There were two pills on your lunch plate today. \nYou were puzzled, and asked around if anyone knew where they might come from. \n\nNo one seemed to have any idea."
                },
                [1] = {
                    "You felt that the Red Pill is burning inside your stomach. You could not help but to stop your work and head to bed. You woke up the next day, your bird was dead."
                },
                [2] = {
                    "There seemed to be a moment of peace. The Blue Pill might afterall have no effect at all. You smiled wildly."
                },
                [3] = {
                    "Now, please continue with your duty."
                }
            },
            selections = {
                ['seleciton-prompt'] = "CHOOSE YOUR FATE:",
                [1] = {
                    text = "Red Pill...",
                    closing = "As you swallowed the Red Pill, you felt a presence haunting right behind you. You quickly turned around, but there was No ONE.",
                    onSelect = function()
                        return 1
                    end
                },
                [2] = {
                    text = "Blue Pill!",
                    closing = "You stared at the Blue Pill for a while. And suddenly, you reached out for it and took it down your throat, so quickly that you questioned yourself if it was your own decidsion.",
                    onSelect = function()
                        return 2
                    end
                },
            },
            outcomes = {
                [1] = math.random(100) <= 33 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 200,
                        ['perception'] = 400
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = -200,
                        ['perception'] = -400
                    },
                    trust = 0,
                    side = 'yellow'
                },
                [2] = math.random(100) <= 80 and {
                    resources = {
                        ['money'] = 1,
                        ['food'] = 1,
                        ['energy'] = 1,
                        ['perception'] = 1
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 200,
                        ['perception'] = 400
                    },
                    trust = 0,
                    side = 'yellow'
                }
            },
            sprites = {

            },
            gameEventFunctions = {
                funcName = function() end
            }
        },
        [2] = {
            name = 'no-name',
            side = 'general',
            type = 'random',
            group = 'later',
            encounter = 14,
            resolve = 14,
            eventID = 202,
            dialogues = {
                [0] = {
                    "The event is a placeholder for an later event, eventID 202"
                },
                [1] = {
                    "You selected option 1 in event 202, there is a 66% chance you will lose 200 energy and 400 perception. 33% of gaining them."
                },
                [2] = {
                    "You selected option 2 in event 202, there is 80% chance of no effect or 20% of losing 20% trust from yellow side."
                },
                [3] = {
                    "Now, please continue with your duty."
                }
            },
            selections = {
                ['seleciton-prompt'] = "EventID 202 selections: ",
                [1] = {
                    text = "1",
                    closing = "You have selected option 1",
                    onSelect = function()
                        return 1
                    end
                },
                [2] = {
                    text = "2",
                    closing = "You have selected option 2",
                    onSelect = function()
                        return 2
                    end
                },
            },
            outcomes = {
                [1] = math.random(100) <= 33 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 200,
                        ['perception'] = 400
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = -200,
                        ['perception'] = -400
                    },
                    trust = 0,
                    side = 'yellow'
                },
                [2] = math.random(100) <= 80 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['perception'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['perception'] = 0
                    },
                    trust = -20,
                    side = 'yellow'
                }
            },
            sprites = {

            },
            gameEventFunctions = {
                funcName = function() end
            }
        },
        [3] = {
            name = 'no-name',
            side = 'yellow',
            type = 'random',
            group = 'later',
            encounter = 11,
            resolve = 11,
            eventID = 203,
            dialogues = {
                [0] = {
                    "The event is a placeholder for an later event, eventID 203"
                },
                [1] = {
                    "You selected option 1 in event 203, there is a 66% chance you will lose 200 energy and 400 perception. 33% of gaining them."
                },
                [2] = {
                    "You selected option 2 in event 203, there is 80% chance of no effect or 20% of losing 20% trust from yellow side."
                },
                [3] = {
                    "Now, please continue with your duty."
                }
            },
            selections = {
                ['seleciton-prompt'] = "EventID 203 selections: ",
                [1] = {
                    text = "1",
                    closing = "You have selected option 1",
                    onSelect = function()
                        return 1
                    end
                },
                [2] = {
                    text = "2",
                    closing = "You have selected option 2",
                    onSelect = function()
                        return 2
                    end
                },
            },
            outcomes = {
                [1] = math.random(100) <= 33 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 200,
                        ['perception'] = 400
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = -200,
                        ['perception'] = -400
                    },
                    trust = 0,
                    side = 'yellow'
                },
                [2] = math.random(100) <= 80 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['perception'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['perception'] = 0
                    },
                    trust = -20,
                    side = 'yellow'
                }
            },
            sprites = {

            },
            gameEventFunctions = {
                funcName = function() end
            }
        },
        [4] = {
            name = 'no-name',
            side = 'yellow',
            type = 'random',
            group = 'later',
            encounter = 15,
            resolve = 15,
            eventID = 204,
            dialogues = {
                [0] = {
                    "The event is a placeholder for an later event, eventID 204"
                },
                [1] = {
                    "You selected option 1 in event 204, there is a 66% chance you will lose 200 energy and 400 perception. 33% of gaining them."
                },
                [2] = {
                    "You selected option 2 in event 204, there is 80% chance of no effect or 20% of losing 20% trust from yellow side."
                },
                [3] = {
                    "Now, please continue with your duty."
                }
            },
            selections = {
                ['seleciton-prompt'] = "EventID 204 selections: ",
                [1] = {
                    text = "1",
                    closing = "You have selected option 1",
                    onSelect = function()
                        return 1
                    end
                },
                [2] = {
                    text = "2",
                    closing = "You have selected option 2",
                    onSelect = function()
                        return 2
                    end
                },
            },
            outcomes = {
                [1] = math.random(100) <= 33 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 200,
                        ['perception'] = 400
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = -200,
                        ['perception'] = -400
                    },
                    trust = 0,
                    side = 'yellow'
                },
                [2] = math.random(100) <= 80 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['perception'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['perception'] = 0
                    },
                    trust = -20,
                    side = 'yellow'
                }
            },
            sprites = {

            },
            gameEventFunctions = {
                funcName = function() end
            }
        },
        [5] = {
            name = 'no-name',
            side = 'purple',
            type = 'random',
            group = 'later',
            encounter = 12,
            resolve = 12,
            eventID = 205,
            dialogues = {
                [0] = {
                    "The event is a placeholder for an later event, eventID 205"
                },
                [1] = {
                    "You selected option 1 in event 205, there is a 66% chance you will lose 200 energy and 400 perception. 33% of gaining them."
                },
                [2] = {
                    "You selected option 2 in event 205, there is 80% chance of no effect or 20% of losing 20% trust from yellow side."
                },
                [3] = {
                    "Now, please continue with your duty."
                }
            },
            selections = {
                ['seleciton-prompt'] = "EventID 205 selections: ",
                [1] = {
                    text = "1",
                    closing = "You have selected option 1",
                    onSelect = function()
                        return 1
                    end
                },
                [2] = {
                    text = "2",
                    closing = "You have selected option 2",
                    onSelect = function()
                        return 2
                    end
                },
            },
            outcomes = {
                [1] = math.random(100) <= 33 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 200,
                        ['perception'] = 400
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = -200,
                        ['perception'] = -400
                    },
                    trust = 0,
                    side = 'yellow'
                },
                [2] = math.random(100) <= 80 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['perception'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['perception'] = 0
                    },
                    trust = -20,
                    side = 'yellow'
                }
            },
            sprites = {

            },
            gameEventFunctions = {
                funcName = function() end
            }
        },
        [6] = {
            name = 'no-name',
            side = 'purple',
            type = 'random',
            group = 'later',
            encounter = 15,
            resolve = 15,
            eventID = 206,
            dialogues = {
                [0] = {
                    "The event is a placeholder for an later event, eventID 206"
                },
                [1] = {
                    "You selected option 1 in event 206, there is a 66% chance you will lose 200 energy and 400 perception. 33% of gaining them."
                },
                [2] = {
                    "You selected option 2 in event 206, there is 80% chance of no effect or 20% of losing 20% trust from yellow side."
                },
                [3] = {
                    "Now, please continue with your duty."
                }
            },
            selections = {
                ['seleciton-prompt'] = "EventID 206 selections: ",
                [1] = {
                    text = "1",
                    closing = "You have selected option 1",
                    onSelect = function()
                        return 1
                    end
                },
                [2] = {
                    text = "2",
                    closing = "You have selected option 2",
                    onSelect = function()
                        return 2
                    end
                },
            },
            outcomes = {
                [1] = math.random(100) <= 33 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 200,
                        ['perception'] = 400
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = -200,
                        ['perception'] = -400
                    },
                    trust = 0,
                    side = 'yellow'
                },
                [2] = math.random(100) <= 80 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['perception'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['perception'] = 0
                    },
                    trust = -20,
                    side = 'yellow'
                }
            },
            sprites = {

            },
            gameEventFunctions = {
                funcName = function() end
            }
        }
    }
}


--[[

Game Event Types:
-   Regular: planned events that will definitely happen at turns
-   Random: a pool of events that will be randomly chosen at start game

Game Events should have the folling states:
-   planned
-   encounter
-   progressing
-   resolve
-   passed

When looping the GameEvents table in PlayState, the following should be the looping order:

for game event in table
    if state is progressing
        if resolve turn is this turn
        change state to resolve

for game event in table
    if state is resolve
        resolve event
        change state to passed

for game event in table
    if state is planned
        if encounter turn is this turn
            change state to encounter

for game event is table
    if state is encounter
        encounter event
        change state to progressing


Game Events data structure desing:
-   encounter: turn number for encountering this event
-   resolve: turn number for resolving this event
-   dialogues[0]: Encountering event dialogues
-   dialogues[1]: Choice 1 at encountering
-   dialogues[2]: Choice 2 at encountering
-   dialogues[3]: Resolving event dialogues
-   selections: 2 Choices which will result in 2 different outcomes
-   outcomes[1]: Outcome related to choice 1, with resource change and trust change
-   outcomes[2]: Outcome related to choice 2, with resource change and trust change

I have decided to generate all events at start of turn 1, rather than at each turn decide if an event should be added. Generating order is as following:

-   Random Events Yellow Side
-   Random Events Purple Side
-   Regular Events Yellow Side
-   Regular Events Purple Side

Thus, When resolving or encountering events, random events always come before regular ones.

--]]
