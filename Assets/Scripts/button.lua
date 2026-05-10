local door = require("Assets.Scripts.door")
local camera = require("orthographic.camera")

---@class button
---@field objectID hash
---@field interaction_num integer
---@field position vector3 tilemap position
---@field activated boolean
local button = {}
button.__index = button

button.buttons = {}

function button.new(objectID, interaction_num, position)
    local self = setmetatable({}, button)
    self.objectID = objectID
    self.interaction_num = interaction_num
    self.position = position
    self.activated = false
    local sprite = msg.url(nil, objectID, "sprite")
    msg.post(sprite, "disable")
    button.buttons[interaction_num] = self
    return self
end

---Fired when a fruit interacts with the button
---@param interaction_num number
---@param other_id hash
function button.interact(interaction_num, other_id)
    local button = button.buttons[interaction_num]
    if button.activated then
        return
    end
    button.activated = true
    sound.play("#click")
    sound.play("#door")
    camera.shake(nil, 0.001, 7.6)
    door.open_all(interaction_num)
    go.delete(other_id, true)
    
    -- change sprite

    
    local sprite = msg.url(nil, button.objectID, "sprite")
    local pos = go.get_position(button.objectID)
    local rot = go.get_rotation(button.objectID)
    local move = vmath.vector3(0, 2.5, 0)

    go.animate(button.objectID, "position", go.PLAYBACK_ONCE_FORWARD, pos + vmath.rotate(rot, move), go.EASING_LINEAR, 0.2)
    msg.post(sprite, "enable")
end

---Returns the location of the button in the `interaction_num` group
---@param interaction_num number
---@return vector3
function button.get_object_ID(interaction_num)
    return button.buttons[interaction_num].objectID
end

function button.clear() -- don't need to deal with game objects since scene controller deletes them for us
    button.buttons = {}
end


setmetatable(button, {
    __call = function (class, ...)
        return class.new(...)
    end
})

return button