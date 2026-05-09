local M = {}

-- focus values: player, boss, door_x, button_x

M.prompts = {
    [1] = {
        events = {
            {text = "Jim Jones: AH! I see you've found my liar", focus = "boss"},
        },
        replayable = false
    }
}

return M