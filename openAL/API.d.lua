---@meta

---@class openal
---@field doppler_factor number
---@field speed_of_sound number
---@field listener listener
openal = {}

---Returns a table with information on OpenAL implementation.
---Fields:
---* vendor
---* version
---* renderer
---* extensions
function openal.get_info() end

---Sets a distance model by which all sound attenuation is calculated.
---Available models:
---* "inverse"
---* "inverse_clamped"
---* "linear"
---* "linear_clamped"
---* "exponent"
---* "exponent_clamped"
---* "none"
---@param distance_model string
function openal.set_distance_model(distance_model) end

---Creates a sound source object and loads a WAV file into it. Only mono WAV files will be positioned. Stereo files will be played as if they are at the listener's position.
---@param resource defold_api.resource
---@return source
function openal.new_source(resource) end

---Destroys the sound source and frees the memory.
---@param source source
function openal.remove_source(source) end

---@class pos_obj
---@field x float
---@field y float
---@field z float
---@field vx float
---@field vy float
---@field vz float
---@field orientation_at_x float
---@field orientation_at_y float
---@field orientation_at_z float
---@field orientation_up_x float
---@field orientation_up_y float
---@field orientation_up_z float
local pos_obj = {}

---@class listener : pos_obj
local listener = {}

---@class source : pos_obj
---@field dx float
---@field dy float
---@field dz float
---@field pitch float
---@field gain float
---@field max_distance float
---@field rolloff_factor float
---@field reference_distance float The distance under which the volume for the source would normally drop by half (before being influenced by source.rolloff_factor or source.max_distance), default is 50.0
---@field min_gain float
---@field max_gain float
---@field cone_outer_gain float
---@field cone_inner_angle float
---@field cone_outer_angle float
---@field is_looping bool
---@field is_relative bool If true, the sound will be positioned relative to the listener, default is false
---@field time float Get or set the sound playback progress in seconds.
---@field state string Possible values: "initial", "playing", "paused", "stopped"
local source = {}

---Starts the playback of the sound from this source.
function source:play() end

---Pauses the playback.
function source:pause() end

---Resets the playback to the start of the sound.
function source:rewind() end

---Stops the playback.
function source:stop() end