local events = require("event.events")
local settings = require("Main.settings")

local prompt = {}
prompt.__index = prompt

prompt.prompts = {}

---@class prompt
---@field interaction_num number
---@field data table
---@field played bool
---@field playing bool
function prompt.prompt(interaction_num, data)
    local self = setmetatable({}, prompt)
    self.interaction_num = interaction_num
    self.data = data
    self.played = false
    self.playing = false
    prompt.prompts[interaction_num] = self
    return self
end

function prompt.play_num(num)
    prompt.prompts[num]:play()
end

function prompt.clear()
    prompt.prompts = {}
end

function prompt:play()
    local data = self.data
    if (not data.replayable and self.played) or self.playing then
        return
    end
    self.playing = true
    self.played = true
    local num_events = #self.data.events
    local index = 1
    
    local handle = timer.delay(settings.prompt_time + 0.2, true, function (self, handle, time_elapsed)
        if index > num_events then
            events.trigger("camera_follow", {target = "player"})
            events.trigger("freeze_player", false)
            self.playing = false
            timer.cancel(handle)
            return
        end
        local event = data.events[index]
        events.trigger("show_prompt", {prompt = event.text})
        if event.focus then
            events.trigger("camera_follow", {target = event.focus})
        end
        if event.freeze ~= nil then
            events.trigger("freeze_player", event.freeze)
        end
        index = index + 1
    end)
    timer.trigger(handle)
end

return prompt