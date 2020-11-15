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
            side = 'yellow',
            type = 'regular',
            encounter = 3,
            resolve = 6,
            dialogues = {
                [0] = {
                    "There is going to be a story here. Manythings have happened. Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah, Blah."
                },
                [1] = {
                    "You have Selected Option 1 in this Event. Here is the result."
                },
                [2] = {
                    "You have Selected Option 2 in this Event. Here is the result."
                },
                [3] = {
                    "Now please continue with your duty."
                }
            },
            selections = {
                ['seleciton-prompt'] = "This is an event. Choose one of the followings: ",
                [1] = {
                    text = "Well...",
                    closing = "So you choose to do this? I will see you again.",
                    onSelect = function()
                        return 1
                    end
                },
                [2] = {
                    text = "Ha!",
                    closing = "I am glad that you did this.",
                    onSelect = function()
                        return 2
                    end
                },
            },
            outcomes = {
                [1] = {
                    resources = {
                        ['money'] = 1,
                        ['food'] = 1,
                        ['energy'] = 1,
                        ['perception'] = 1
                    },
                    trust = 1
                },
                [2] = {
                    resources = {
                        ['money'] = -1,
                        ['food'] = -1,
                        ['energy'] = -1,
                        ['perception'] = -1
                    },
                    trust = -1
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
