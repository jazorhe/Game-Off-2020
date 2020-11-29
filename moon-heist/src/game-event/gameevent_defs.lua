REGULAR_EVENTS = {}

RANDOM_EVENTS = {
    ['early'] = {
        [1] = {
            name = 'Two Pills',
            side = 'general',
            type = 'random',
            group = 'early',
            encounter = 3,
            resolve = 3,
            eventID = 101,
            inPool = true,
            dialogues = {
                [0] = {
                    "There were two pills on your lunch plate today. \n"..
                    "You were puzzled, and asked around if anyone knew where they might be. \n\n"..
                    "No one seemed to have any idea."
                },
                [1] = {
                    "You felt that the Red Pill was burning in your gut. You could not help but to stop your work and head to bed. You woke up the next day, your bird was dead."
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
                    text = "I wanted the Red Pill...",
                    closing = "As you swallowed the Red Pill, you felt a haunting presence right behind you. You quickly turned around, but there was NO ONE.",
                    onSelect = function()
                        return 1
                    end
                },
                [2] = {
                    text = "I liked the Blue Pill!",
                    closing = "You stared at the Blue Pill for a while. And all of a sudden, you reached out for it and took it down your throat. It all happened so quickly that you questioned if it was your own decision.",
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
                        ['amenity'] = 400
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = -200,
                        ['amenity'] = -400
                    },
                    trust = 0,
                    side = 'yellow'
                },
                [2] = math.random(100) <= 80 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 200,
                        ['amenity'] = 400
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
            name = 'Aliens I',
            side = 'general',
            type = 'random',
            group = 'early',
            encounter = 3,
            resolve = 3,
            eventID = 102,
            inPool = true,
            dialogues = {
                [0] = {
                    "There had been reports of encountering unidentified creatures near a mysterious crater. You sent a squad to investigate the situation."
                },
                [1] = {
                    "Those faceless monsters chased the squad to a crater. Their truck ran into a rock and was stuck. No one lived to tell the story."
                },
                [2] = {
                    "You shot the jaw off one of these monsters and saved the team from crushing their truck. You thought that it was not enough, so you went down this crater with a dozen of your guys.\n"..
                    "This had turned from rescuing to hunting, and you loved hunting."
                },
                [3] = {
                    "Those creatures finally vanished deep into the crater, like they had never existed. You could do nothing more than reporting it and keeping an eye out."
                }
            },
            selections = {
                ['seleciton-prompt'] = "\"We have been ATTACKED!\" You heard scientists screaming over the radio. You had no idea what those creatures were. No one knew. \n"..
                "What was your decision?",
                [1] = {
                    text = "Let us retreat and leave them alone.",
                    closing = "You have asked the squad to retreat quickly.",
                    onSelect = function()
                        return 1
                    end
                },
                [2] = {
                    text = "We have the guns. We will destroy them!",
                    closing = "The majority of the Moon base was out for rescuing the team by your order.",
                    onSelect = function()
                        return 2
                    end
                },
            },
            outcomes = {
                [1] = math.random(100) <= 100 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = -300
                    },
                    trust = -10,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                },
                [2] = math.random(100) <= 100 and {
                    resources = {
                        ['money'] = 350,
                        ['food'] = 200,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = 10,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
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
        [3] = {
            name = 'Protests Against Space Immigration',
            side = 'yellow',
            type = 'random',
            group = 'early',
            encounter = 3,
            resolve = 3,
            eventID = 111,
            inPool = true,
            dialogues = {
                [0] = {
                    "[*News Broadcasting*]\n"..
                    "There have been protests recently all around the world against the new in-construction MoonBase and the plans for potential Space Immigration within the next decade.\n\n"..
                    "Protesters argued that their taxation has been wasted on something that they \"will never benefit from\", and that Space Immigration is nothing but an \"evil practise of colonialism. They have demanded the UN to cut costs on this meaningless project.\""
                },
                [1] = {
                    "You received a written warning from the Root 67 association. In the letter they wrote: \"Watch your tongue!\""
                },
                [2] = {
                    "The Root 67 association decided to cut the budget for this project, but they still demand you to deliver the result within the same amount of time."
                },
                [3] = {
                    "Now, please continue with your duty."
                }
            },
            selections = {
                ['seleciton-prompt'] = "[*News Broadcasting*]\n"..
                "The responsible official from this project has, on a video call, responded to the protests this way:",
                [1] = {
                    text = "\"We have a dream in common, let us make it come true regardless of its cost.\"",
                    closing = "[*News Broadcasting*]\n"..
                    "As said by the official. The voice of protesters continued to rise, the crowd were extremely disappointed and accused that \"a coldblooded dictatorship\".",
                    onSelect = function()
                        return 1
                    end
                },
                [2] = {
                    text = "\"We care about every soul on Earth, if building the MoonBase will make Earth suffer, we can slow this down.\"",
                    closing = "[*News Broadcasting*]\n"..
                    "As said by the official. Protester says that these are \"hopeless lies\" and would only consider the value of this project if they see \"actual benefits\" from it.",
                    onSelect = function()
                        return 2
                    end
                },
            },
            outcomes = {
                [1] = math.random(100) <= 100 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = -20,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                },
                [2] = math.random(100) <= 100 and {
                    resources = {
                        ['money'] = -300,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = 10,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
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
        [4] = {
            name = 'Power Plant Investment',
            side = 'yellow',
            type = 'random',
            group = 'early',
            encounter = 3,
            resolve = 3,
            eventID = 112,
            inPool = true,
            dialogues = {
                [0] = {
                    "The Chief Engineer from the Nuclear Power Plant came to you and suggested that he might have found a way to produce a lot of energy at once."
                },
                [1] = {
                    "\"No risk, no gain.\" Someone once said."
                },
                [2] = {
                    "\"No risk, no gain.\" Someone once said."
                },
                [3] = {
                    "You should learn to trust your luck more."
                }
            },
            selections = {
                ['seleciton-prompt'] = "Did you want to invest for a one off earning?",
                [1] = {
                    text = "I will give you 300 Energy. Spend them well.",
                    closing = "\"Thank you, boss.\" The engineer left with excitement.",
                    onSelect = function()
                        return 1
                    end
                },
                [2] = {
                    text = "We will not risk it.",
                    closing = "The engineer was disappointed.",
                    onSelect = function()
                        return 2
                    end
                },
            },
            outcomes = {
                [1] = math.random(100) <= 66 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 900,
                        ['amenity'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                },
                [2] = math.random(100) <= 100 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                }
            },
            sprites = {

            },
            gameEventFunctions = {
                funcName = function(selection)
                    if selection == 1 then
                        Event.dispatch('resource-management', {
                            resourceTable = {
                                ['money'] = 0,
                                ['food'] = 0,
                                ['energy'] = -300,
                                ['amenity'] = 0
                            }
                        })
                    end
                end
            }
        },
        [5] = {
            name = 'Lunar Long Jump Competition',
            side = 'purple',
            type = 'random',
            group = 'early',
            encounter = 3,
            resolve = 3,
            eventID = 113,
            inPool = true,
            dialogues = {
                [0] = {
                    "Your staff decided to host a Lunar Long Jump Competition, gathering the best of the best on the Moon. You were invited to participate in this competition."
                },
                [1] = {
                    ""
                },
                [2] = {
                    "The competition was hosted successfully and everyone enjoyed the atmosphere."
                },
                [3] = {
                    "Now, please continue with your duty."
                }
            },
            selections = {
                ['seleciton-prompt'] = "How did you respond to this invitation?",
                [1] = {
                    text = "\"The champion is standing right in front of you.\"",
                    closing = "You have decided to join this competition.",
                    onSelect = function()
                        return 1
                    end
                },
                [2] = {
                    text = "\"I would rather be watching.\"",
                    closing = "You refused to join the competion.",
                    onSelect = function()
                        return 2
                    end
                },
            },
            outcomes = {
                [1] = math.random(100) <= 66 and {
                    resources = {
                        ['money'] = 300,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 300
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = -200,
                        ['amenity'] = 200
                    },
                    trust = 0,
                    side = 'yellow'
                },
                [2] = math.random(100) <= 0 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                }
            },
            sprites = {

            },
            gameEventFunctions = {
                funcName = function()
                    if selection == 1 and RANDOM_EVENTS['early'][5].outcomes[1].money > 0 then
                        RANDOM_EVENTS['early'][5].dialogues[1] = "You had shown exemplary long jump skills and you had won the competition. There was a bit of money as an award."
                    elseif seleciton == 1 and RANDOM_EVENTS['early'][5].outcomes[1].trust == 0 then
                        RANDOM_EVENTS['later'][5].dialogues[1] = "You might have put too much power in your feet and you flew such a long way and landed ungracefully. That was not exemplary, however, people still cheered for your action."
                    end
                end
            }
        },
        [6] = {
            name = 'Dark Lab Investment',
            side = 'purple',
            type = 'random',
            group = 'early',
            encounter = 3,
            resolve = 3,
            eventID = 122,
            inPool = true,
            dialogues = {
                [0] = {
                    "A Senior Scientist from the Dark Lab came to you and suggested that he might have found a way to produce a lot of money at once."
                },
                [1] = {
                    "\"No risk, no gain.\" Someone once said."
                },
                [2] = {
                    "\"No risk, no gain.\" Someone once said."
                },
                [3] = {
                    "You should learn to trust your luck more."
                }
            },
            selections = {
                ['seleciton-prompt'] = "Did you want to invest for a one off earning?",
                [1] = {
                    text = "I will give you 300 Money. Spend them well.",
                    closing = "\"You will not regret it, boss.\" The scientist left with excitement.",
                    onSelect = function()
                        return 1
                    end
                },
                [2] = {
                    text = "I do not like risk.",
                    closing = "The scientist left with hatred on his face.",
                    onSelect = function()
                        return 2
                    end
                },
            },
            outcomes = {
                [1] = math.random(100) <= 60 and {
                    resources = {
                        ['money'] = 900,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                },
                [2] = math.random(100) <= 100 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                }
            },
            sprites = {

            },
            gameEventFunctions = {
                funcName = function()
                    funcName = function(selection)
                        if selection == 1 then
                            Event.dispatch('resource-management', {
                                resourceTable = {
                                    ['money'] = -300,
                                    ['food'] = 0,
                                    ['energy'] = 0,
                                    ['amenity'] = 0
                                }
                            })
                        end
                    end
                end
            }
        }
    },
    ['later'] = {
        [1] = {
            name = 'Aliens II',
            side = 'general',
            type = 'random',
            group = 'later',
            encounter = 3,
            resolve = 3,
            eventID = 201,
            inPool = true,
            dialogues = {
                [0] = {
                    "You have received reports with faceless monsters crawling out a giant crater not far north. They were moving quickly towards your Base. You knew that this day would come. "
                },
                [1] = {
                    "Troops from earth arrived within an hour. They were sent into that crater, and fortunately, there were not many of these things. Before the troops left the Moon, they handed you some supplies from Root 67."
                },
                [2] = {
                    "A war machine raised from the horizon. It drove into the mysterious crater, with swords and toxic gas bombs hanging off its 12 arms. Then there was the sound of splashing liquid, and then there was silence."
                },
                [3] = {
                    "The fight ended up being a tough win, but you received supplies to cover some loss."
                }
            },
            selections = {
                ['seleciton-prompt'] = "\"There are too many of them! We need backup!\" You heard screams on the radio. You needed help.",
                [1] = {
                    text = "I went to Root 67 for help.",
                    closing = "You put the number in your desk phone.",
                    onSelect = function()
                        return 1
                    end
                },
                [2] = {
                    text = "I went to Ong for help.",
                    closing = "You pulled out that old pager.",
                    onSelect = function()
                        return 2
                    end
                },
            },
            outcomes = {
                [1] = math.random(100) <= 100 and {
                    resources = {
                        ['money'] = 800,
                        ['food'] = 800,
                        ['energy'] = -400,
                        ['amenity'] = -400
                    },
                    trust = 10,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                },
                [2] = math.random(100) <= 100 and {
                    resources = {
                        ['money'] = -400,
                        ['food'] = -400,
                        ['energy'] = 800,
                        ['amenity'] = 800
                    },
                    trust = 10,
                    side = 'purple'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
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
            name = 'Nobel Winner',
            side = 'general',
            type = 'random',
            group = 'later',
            encounter = 3,
            resolve = 3,
            eventID = 202,
            inPool = true,
            dialogues = {
                [0] = {
                    "This years Nobel Peace Price Results had been announced. You were, unexpectedly the Winner. You had been awarded because of your ongoing contribution to the MoonBase project, and your incredible negotiation skills shown when working with Root 67. You were asked to give an Acceptance Speech."
                },
                [1] = {
                    "A new wave of Space Fever swept across the Earth. From young kids at school to dying men on bed, no one did not think about space. No one did not think about living on the Moon. This planet was dreaming."
                },
                [2] = {
                    "You were right, this was an incredible engineering project, supported by hundreds of thousands of engineers and scientists. We did not achieve it with dreams, but maths and physics. Root 67 was glad that you pointed it out."
                },
                [3] = {
                    "Now, please continue with your duty."
                }
            },
            selections = {
                ['seleciton-prompt'] = "What did you say?",
                [1] = {
                    text = "\"Space Immigration is the most ambitious dream ever since human history. I am glad to be the first person to do it.\"",
                    closing = "You chose to express your sensibility.",
                    onSelect = function()
                        return 1
                    end
                },
                [2] = {
                    text = "\"There is nothing romantic under the curtain, but precise planning and hand in hand colaborations.\"",
                    closing = "You chose to express your rationality.",
                    onSelect = function()
                        return 2
                    end
                },
            },
            outcomes = {
                [1] = math.random(100) <= 100 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 600
                    },
                    trust = 5,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                },
                [2] = math.random(100) <= 100 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = 20,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
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
        [3] = {
            name = 'Blackmail',
            side = 'Yellow',
            type = 'random',
            group = 'later',
            encounter = 3,
            resolve = 3,
            eventID = 211,
            inPool = true,
            dialogues = {
                [0] = {
                    "A researcher from the MoonBase tried to blackmail you, he calimed that he had just enough evidence to get you off your seat."
                },
                [1] = {
                    "It had been more than few years since you did this kind of physical work. You felt exausted coming to work the next day."
                },
                [2] = {
                    "Money is a dirty thing but it does the job."
                },
                [3] = {
                    "Now, please continue with your duty."
                }
            },
            selections = {
                ['seleciton-prompt'] = "You had decided to:",
                [1] = {
                    text = "Bury him at the gravity well one night",
                    closing = "What an excellent decision!",
                    onSelect = function()
                        return 1
                    end
                },
                [2] = {
                    text = "Pay to shut his mouth.",
                    closing = "You were not very pleased but you had to pay up.",
                    onSelect = function()
                        return 2
                    end
                },
            },
            outcomes = {
                [1] = math.random(100) <= 100 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = -200,
                        ['amenity'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                },
                [2] = math.random(100) <= 100 and {
                    resources = {
                        ['money'] = -400,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = 10,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
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
        [4] = {
            name = 'What was on the Other Side?',
            side = 'yellow',
            type = 'random',
            group = 'later',
            encounter = 3,
            resolve = 3,
            eventID = 204,
            inPool = true,
            dialogues = {
                [0] = {
                    "Root 67 had demanded a report on the back side of the Moon."
                },
                [1] = {
                    "Root 67 was not satisfied with your report, \"You should be working, not sipping on a coffee everyday.\""
                },
                [2] = {
                    "Root 67 asked you to focus on the current MoonBase, and would support for more mining facilities after 18 months."
                },
                [3] = {
                    "Hopy you knew what you were doing here."
                }
            },
            selections = {
                ['seleciton-prompt'] = "What did you discuss in this report?",
                [1] = {
                    text = "There were craters after craters. Nothing interesting to see.",
                    closing = "You tried to avoid the question.",
                    onSelect = function()
                        return 1
                    end
                },
                [2] = {
                    text = "There were possibilities of valuable materials on that side.",
                    closing = "You gave them false information.",
                    onSelect = function()
                        return 2
                    end
                },
            },
            outcomes = {
                [1] = math.random(100) <= 100 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = -15,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                },
                [2] = math.random(100) <= 100 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 200,
                        ['amenity'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
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
        [5] = {
            name = 'Steal This For Me!',
            side = 'purple',
            type = 'random',
            group = 'later',
            encounter = 3,
            resolve = 3,
            eventID = 205,
            inPool = true,
            dialogues = {
                [0] = {
                    "(On a regular vedio conference with the Ong Boss)\n"..
                    "We heard about the latest breakthrough in the Dark Matter territory. You would have received some blueprints for the next generation Dark Matter Detector.\n"..
                    "I need you to send us a copy of everything about this facility."
                },
                [1] = {
                    ""
                },
                [2] = {
                    "\"Hey, remind me why we hired you?\""
                },
                [3] = {
                    "Now, please continue with your duty."
                }
            },
            selections = {
                ['seleciton-prompt'] = "[*You thought carefully about how to respond this*]",
                [1] = {
                    text = "\"You will have it tomorrow on your desk.\"",
                    closing = "You promised your boss like it was a simple task.",
                    onSelect = function()
                        return 1
                    end
                },
                [2] = {
                    text = "\"This is rather difficult to do.\"",
                    closing = "You were always careful about not exposing yourself.",
                    onSelect = function()
                        return 2
                    end
                },
            },
            outcomes = {
                [1] = math.random(100) <= 66 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = -25,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 800
                    },
                    trust = 10,
                    side = 'purple'
                },
                [2] = math.random(100) <= 100 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = -25,
                    side = 'purple'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                }
            },
            sprites = {

            },
            gameEventFunctions = {
                funcName = function(selection)
                    if selection == 1 and RANDOM_EVENTS['later'][5].outcomes[1].trust < 0 then
                        RANDOM_EVENTS['later'][5].dialogues[1] = "You had been too good of a project manager lately, you almost forgot how to be a spy. You made a simple mistake while transfering the blueprints. You had to make up an excuse on the spot in a meeting with Root 67."
                    elseif seleciton == 1 and RANDOM_EVENTS['later'][5].outcomes[1].trust == 0 then
                        RANDOM_EVENTS['later'][5].dialogues[1] = "It was a swift heist. You deserved to be rewarded."
                    end
                end
            }
        },
        [6] = {
            name = 'We Need More Gold',
            side = 'purple',
            type = 'random',
            group = 'later',
            encounter = 3,
            resolve = 3,
            eventID = 206,
            inPool = true,
            dialogues = {
                [0] = {
                    "It was meant to be a nice morning, until a handful of Ong staff rushed into your office."
                },
                [1] = {
                    "You managed to calm them, but the money had to come from somewhere."
                },
                [2] = {
                    "You can shear a sheep a hundred times, but you can skin it only once."
                },
                [3] = {
                    "Now, please continue with your duty."
                }
            },
            selections = {
                ['seleciton-prompt'] = "They asked for an increase on their salary.",
                [1] = {
                    text = "I approved it on the spot.",
                    closing = "You decided to keep the staff happy. After all you knew well about the exploitation in this company.",
                    onSelect = function()
                        return 1
                    end
                },
                [2] = {
                    text = "I shook my head: \"Go back to work.\"",
                    closing = "You kept your principle as well as your poker face.",
                    onSelect = function()
                        return 2
                    end
                },
            },
            outcomes = {
                [1] = math.random(100) <= 100 and {
                    resources = {
                        ['money'] = -400,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 200
                    },
                    trust = 0,
                    side = 'yellow'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
                    },
                    trust = 0,
                    side = 'yellow'
                },
                [2] = math.random(100) <= 100 and {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = -600
                    },
                    trust = 10,
                    side = 'purple'
                } or {
                    resources = {
                        ['money'] = 0,
                        ['food'] = 0,
                        ['energy'] = 0,
                        ['amenity'] = 0
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
