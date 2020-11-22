TUTORIAL_DEFS = {
    [0] = {
        name = 'welcome-skip-tutorial',
            dialogueParams = {
            x = 180,
            y = VIRTUAL_HEIGHT / 2 - 40,
            width = VIRTUAL_WIDTH - 360,
            height = 80,
            text = "Welcome to the world of Moon Heist! There is meant to be an introduction here but I am going to skip for now! (Press Enter or Click the screen to dismiss dialogues)",
            wrap = 12,
            bgcolour = YELLOW_UI_BG,
            textcolour = YELLOW_TEXT,
            callback = function() end
        },
        stencilParams = {
            x = 0,
            y = 0,
            width = 0,
            height = 0
        },
        callback = function() end
    },
    [1] = {
        name = 'welcome',
            dialogueParams = {
            x = 180,
            y = VIRTUAL_HEIGHT / 2 - 40,
            width = VIRTUAL_WIDTH - 360,
            height = 80,
            text = "Welcome to the world of Moon Heist!\n" ..
            "You have just been assigned to manage the first Moon Base ever built by the human race. 67 contries on earth have come together and established the group \"Root 67\" and their first plan is to achieve Moon immigration!\n" ..
            "You have 18 Months to prove that you are worthy of becoming the new mayor of the first city on Moon.",
            wrap = 12,
            bgcolour = YELLOW_UI_BG,
            textcolour = YELLOW_TEXT,
            callback = function() end
        },
        stencilParams = {
            x = 0,
            y = 0,
            width = 0,
            height = 0
        },
        callback = function()
            gStateStack:push(TutorialState(
                TUTORIAL_DEFS[2].dialogueParams,
                TUTORIAL_DEFS[2].stencilParams,
                TUTORIAL_DEFS[2].callback))
        end
    },
    [2] = {
        name = 'status',
            dialogueParams = {
            x = 180,
            y = VIRTUAL_HEIGHT / 2 - 40,
            width = VIRTUAL_WIDTH - 360,
            height = 80,
            text = "Here shows your current status. It includes:\n" ..
            "The current month number,\n" ..
            "your trust percentage from the government,\n" ..
            "the resources you have and\n" ..
            "how they are going to change next month.",
            wrap = 12,
            bgcolour = YELLOW_UI_BG,
            textcolour = YELLOW_TEXT,
            callback = function() end
        },
        stencilParams = {
            x = 15,
            y = 195,
            width = 125,
            height = 135
        },
        callback = function()
            gStateStack:push(TutorialState(
                TUTORIAL_DEFS[3].dialogueParams,
                TUTORIAL_DEFS[3].stencilParams,
                TUTORIAL_DEFS[3].callback))
        end
    },
    [3] = {
        name = 'facilities',
            dialogueParams = {
            x = 180,
            y = VIRTUAL_HEIGHT / 2 - 80,
            width = VIRTUAL_WIDTH - 360,
            height = 80,
            text = "Here are the facilities that you need to manage for the government. There are 6 facilities in total. Your end goal is to reach level 3 for the 6th facility (Space Harbour). Each turn, each facility will consume energy and food. But they will also earn other things for you. Do not let them drop below 0. You will be fire.",
            wrap = 12,
            bgcolour = YELLOW_UI_BG,
            textcolour = YELLOW_TEXT,
            callback = function() end
        },
        stencilParams = {
            x = 360,
            y = 190,
            width = 250,
            height = 130
        },
        callback = function()
            gStateStack:push(TutorialState(
                TUTORIAL_DEFS[4].dialogueParams,
                TUTORIAL_DEFS[4].stencilParams,
                TUTORIAL_DEFS[4].callback))
        end
    },
    [4] = {
        name = 'sides',
            dialogueParams = {
            x = 510,
            y = 120,
            width = 100,
            height = 50,
            text = "Hold on a second, what is this button!?",
            wrap = 12,
            bgcolour = YELLOW_UI_BG,
            textcolour = YELLOW_TEXT,
            callback = function() end
        },
        stencilParams = {
            x = 615,
            y = 165,
            width = 25,
            height = 55
        },
        callback = function()
            Event.dispatch('shift-right')
            Timer.after(0.7, function()
                gStateStack:push(TutorialState(
                    TUTORIAL_DEFS[5].dialogueParams,
                    TUTORIAL_DEFS[5].stencilParams,
                    TUTORIAL_DEFS[5].callback))
                end
            )
        end
    },
    [5] = {
        name = 'purple',
            dialogueParams = {
            x = 180,
            y = VIRTUAL_HEIGHT / 2 - 40,
            width = VIRTUAL_WIDTH - 360,
            height = 80,
            text = "What...",
            wrap = 12,
            bgcolour = PURPLE_UI_BG,
            textcolour = PURPLE_TEXT,
            callback = function() end
        },
        stencilParams = {
            x = 0,
            y = 0,
            width = 0,
            height = 0
        },
        callback = function()
            gStateStack:push(TutorialState(
                TUTORIAL_DEFS[6].dialogueParams,
                TUTORIAL_DEFS[6].stencilParams,
                TUTORIAL_DEFS[6].callback))
        end
    },
    [6] = {
        name = 'purple',
            dialogueParams = {
            x = 180,
            y = VIRTUAL_HEIGHT / 2 - 40,
            width = VIRTUAL_WIDTH - 360,
            height = 80,
            text = "[*Clearing throat*]\n" ..
            "Congratulations, you have found the other side of the Moon. And yes, agent, welcome to the best Technology company on Earth, now also on Moon. The 0N9 Group.\n" ..
            "We hired you not because you are a brilliant SPY, but also your ambition to advance the human race.",
            wrap = 12,
            bgcolour = PURPLE_UI_BG,
            textcolour = PURPLE_TEXT,
            callback = function() end
        },
        stencilParams = {
            x = 0,
            y = 0,
            width = 0,
            height = 0
        },
        callback = function()
            gStateStack:push(TutorialState(
                TUTORIAL_DEFS[7].dialogueParams,
                TUTORIAL_DEFS[7].stencilParams,
                TUTORIAL_DEFS[7].callback))
        end
    },
    [7] = {
        name = 'purple',
            dialogueParams = {
            x = 180,
            y = VIRTUAL_HEIGHT / 2 - 40,
            width = VIRTUAL_WIDTH - 360,
            height = 80,
            text = "Your mission, is to build the 6th facility for the 0N9 Group, the Solar Sail. Which will allow us to Steal The Moon away from the Earth, and develop our own order on this planet. Advance the human race to next level.\n" ..
            "Now, enough with the introduction, get your work done.",
            wrap = 12,
            bgcolour = PURPLE_UI_BG,
            textcolour = PURPLE_TEXT,
            callback = function() end
        },
        stencilParams = {
            x = 0,
            y = 0,
            width = 0,
            height = 0
        },
        callback = function()
            Event.dispatch('shift-left')
            Timer.after(0.7, function()
                gStateStack:push(TutorialState(
                    TUTORIAL_DEFS[8].dialogueParams,
                    TUTORIAL_DEFS[8].stencilParams,
                    TUTORIAL_DEFS[8].callback))
                end
            )
        end
    },
    [8] = {
        name = 'purple',
            dialogueParams = {
            x = 180,
            y = VIRTUAL_HEIGHT / 2 - 40,
            width = VIRTUAL_WIDTH - 360,
            height = 80,
            text = "That was quite an introduction. You should now continue with your duty. You should know that resources are shared between the two sides, while trust level are handled sperately. If trust on the left side goes below 0, you will also lose your job. So be wise. \n\n" ..
            "Finally, It is up to your choice which side you would like to help.",
            wrap = 12,
            bgcolour = GENERAL_BG,
            textcolour = GENERAL_TEXT,
            callback = function() end
        },
        stencilParams = {
            x = 0,
            y = 0,
            width = 0,
            height = 0
        },
        callback = function()
            Event.dispatch('next-turn')
        end
    }
}
