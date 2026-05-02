---@class Interaction: druid.widget
local Interaction = {}

function Interaction:init()
    self.root = self:get_node("root")

    self.text = self.druid:new_text("text", "generic action", "no_adjust")
    self.action_button = self:get_node("button_image")

    self:hide()
end

function Interaction:show(key, text)
    local success, err = pcall(function ()
        gui.play_flipbook(self.action_button,  key.."_white")
    end)
    if err then
        error("interaction GUI: invalid key", 1)
        return
    end
    self.text:set_text(text)
    gui.set_enabled(self.root, true)
end

function Interaction:hide()
    gui.set_enabled(self.root, false)
end


return Interaction