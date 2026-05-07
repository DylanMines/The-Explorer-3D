---This is a template for a Location Druid widget.
---Instantiate this template with `druid.new_widget(widget_module, [template_id], [nodes])`.
---Read more about Druid Widgets here: ...
local panthera = require("panthera.panthera")
local animation = require("Assets.UI.location.location_panthera") -- Path to Lua animation file
---@class widget.location: druid.widget
local M = {}


function M:init()
	self.root = self:get_node("root")
	self.text = self.druid:new_text("text")
	self.animation = panthera.create_gui(animation, self:get_template(), self:get_nodes())
end

function M:show(location_name)
	self.text:set_text(location_name)
	panthera.play(self.animation, "show", {
		is_loop = false
	})
end

function M:hide()
	panthera.play(self.animation, "hide", {
		is_loop = false
	})
end


return M
