local M = {}

M.name = "the labrynth"
M.prompts = {
    [1] = {
        events = 
        {
            {text = "This level is called the labrynth"},
            {text = "It is exceptionally larger than the other maps"},
            {text = "be warned, you cannot save your game"},
            {text = "good luck. If you finish, let me know what you think"}
        },
        skippable = false
    }
}
return M