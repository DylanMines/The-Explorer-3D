local prompt = require("Assets.Scripts.prompt")

---@class prompt_object
---@field objectID hash
---@field interaction_num integer
local prompt_object = {}
prompt_object.__index = prompt_object

prompt_object.prompt_objects = {}

function prompt_object.object(objectID, interaction_num)
    local self = setmetatable({}, prompt_object)
    self.objectID = objectID
    self.interaction_num = interaction_num
    prompt_object.prompt_objects[objectID] = self
    return self
end

function prompt_object.clear()
    prompt_object.prompt_objects = {}
end

function prompt_object.interact(objectID)
    prompt.play_num(prompt_object.prompt_objects[objectID].interaction_num)
end


return prompt_object