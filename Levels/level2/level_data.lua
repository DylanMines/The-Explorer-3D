local M = {}

-- focus values: player, boss, door_x, button_x

M.name = "Twin paths"

M.prompts = {
    [1] = {
        events = {
            {text = "there are two different paths you can take", freeze = true},
            {text = "only one of them will let you unlock the final door", freeze = true, focus = "door_4"},
            {text = "press 'p' to pause and restart, if needed", freeze = false, focus = "player"}
        },
        replayable = false
    },
    [2] = {
        events = {
            {text = "press 'p' to pause and restart"}
        },
        replayable = true
    }
}

return M