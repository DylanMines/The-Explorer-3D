local M = {}

-- focus values: player, boss, door_x, button_x

M.name = "Entrance"

M.prompts = {
    [1] = {
        events = {
            {text = "It appears the door is closing behind me!", freeze = true},
            {text = "I better try to find a way out", freeze = false}
        },
        replayable = false
    },
    [2] = {
        events = {
            {text = "I need to find a way to open that door", freeze = true, focus = "door_1"},
        },
        replayable = false
    },
    [3] = {
        events = {
            {text = "Maybe that extrusion on the wall has something to do with it", freeze = true, focus = "button_1"},
        },
        replayable = false
    },
    [4] = {
        events = {
            {text = "Into the unknown..."},
        },
        replayable = true
    }
}

return M