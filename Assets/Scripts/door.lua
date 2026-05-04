local fow = require("light_and_shadows.fow")

---@class door
---@field objectID hash
---@field interaction_num integer
---@field position vector3 tilemap position
local door = {}
door.__index = door

door.doors = {}

function door.new(objectID, interaction_num, position)
    local self = setmetatable({}, door)
    self.objectID = objectID
    self.interaction_num = interaction_num
    self.position = position
    if not door.doors[interaction_num] then
        door.doors[interaction_num] = {}
    end
    table.insert(door.doors[interaction_num], self)
    return self
end

---@param interaction_num integer
function door.open_all(interaction_num)
    if door.doors[interaction_num] == nil then print(interaction_num); return end
    for i, v in ipairs(door.doors[interaction_num]) do
        v:open()
    end
end

function door:open()
    local pos = go.get_position(self.objectID)
    go.animate(self.objectID, "position", go.PLAYBACK_ONCE_FORWARD, pos - vmath.vector3(0, 0, 32), go.EASING_LINEAR, 7.6, 0, function ()
        fow.set_b(self.position.x, self.position.y, 0)
        msg.post(self.objectID, "disable")
    end)
    
end

setmetatable(door, {
    __call = function (class, ...)
        return class.new(...)
    end
})

return door