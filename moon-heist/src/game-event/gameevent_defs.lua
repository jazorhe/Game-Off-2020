REGULAR_EVENTS =
{
    ['yellow'] = {
        [1] = {
            side = 'yellow',
            type = 'regular',
            encounter = 3,
            resolve = 6,
            dialogues = {
                [0] = {
                    "",
                    ""
                },
                [1] = {
                    "",
                    ""
                },
                [2] = {
                    "",
                    ""
                },
                [3] = {
                    "",
                    ""
                }
            },
            selections = {
                "",
                ""
            },
            outcomes = {
                [1] = {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['perception'] = 0
                    },
                    trust = 0
                },
                [2] = {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['perception'] = 0
                    },
                    trust = 0
                }
            },
            sprites = {

            },
            gameEventFunctions = {
                funcName = function() end
            }
        }
    },
    ['purple'] = {
    }
}

RANDOM_EVENTS = {
    ['yellow'] = {
        [1] = {
            side = 'general',
            type = 'random',
            group = 'early',
            encounter = 3,
            resolve = 3,
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
        }
    },
    ['purple'] = {
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
