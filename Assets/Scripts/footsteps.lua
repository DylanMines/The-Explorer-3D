local footsteps = {
    playing = false,
    walking = false,
    delay = 0.2
}

local step_sounds = {
    "step1",
    "step2",
    "step3"
}

local function choose_sound()
    print(math.random(1, #step_sounds))
    return step_sounds[math.random(1, #step_sounds)]
end

function footsteps.start(sound_object)
    if footsteps.playing then
        return
    end
    local soundId = sound_object.."#"..choose_sound()
    footsteps.playing = true
    footsteps.walking = true
    sound.play(soundId, nil, function (self, message_id, message, sender)
        timer.delay(footsteps.delay, false, function ()
            footsteps.playing = false
            if footsteps.walking then
                footsteps.start(sound_object)
            end
        end)
    end)
end

function footsteps.stop(sound_object)
    footsteps.walking = false
end

return footsteps