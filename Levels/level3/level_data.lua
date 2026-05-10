local M = {}

M.name = "maze"

M.prompts = {
    [1] = {
        events = {
            {text = "this maze is long"},
            replayable = false
        }
    }
}

return M