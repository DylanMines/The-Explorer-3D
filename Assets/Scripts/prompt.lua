local events = require("event.events")
local settings = require("Main.settings")

local prompt = {}
prompt.__index = prompt

prompt.prompts = {}

local function stop_prompt(self)
    timer.cancel(self.handle)
    events.trigger("camera_follow", {target = "player"})
    events.trigger("freeze_player", false)
    self.playing = false
    
    self.handle = nil
end

local function skip(self)
    if self.handle then
        stop_prompt(self)
    end
end

---@class prompt
---@field interaction_num number
---@field data table
---@field played bool
---@field playing bool
---@field handle any
function prompt.prompt(interaction_num, data)
    local self = setmetatable({}, prompt)
    self.interaction_num = interaction_num
    self.data = data
    self.played = false
    self.playing = false
    self.handle = nil
    prompt.prompts[interaction_num] = self
    events.subscribe("skip_prompt", skip, self)
    return self
end

function prompt.play_num(num)
    prompt.prompts[num]:play()
end

function prompt.clear()
    for key, value in pairs(prompt.prompts) do
        value:close()
    end
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
    
    self.handle = timer.delay(settings.prompt_time, true, function ()
        if index > num_events then
            stop_prompt(self)
            return
        end
        local event = data.events[index]
        local next = index < num_events
        print(data.skippable)
        local skippable = data.skippable
        if skippable == nil then skippable = true end
        events.trigger("show_prompt", {prompt = event.text, next = next, skippable = skippable})
        if event.focus then
            events.trigger("camera_follow", {target = event.focus})
        end
        if event.freeze ~= nil then
            events.trigger("freeze_player", event.freeze)
        end
        index = index + 1
    end)
    timer.trigger(self.handle)
end

function prompt:close()
    events.unsubscribe("skip_prompt", skip, self)
end

return prompt