return {
    data = {
        animations = {
            {
                animation_id = "show",
                animation_keys = {
                    {
                        easing = "outsine",
                        key_type = "tween",
                        node_id = "text",
                        property_id = "color_a",
                        start_value = 1,
                    },
                    {
                        easing = "outsine",
                        key_type = "tween",
                        node_id = "underline",
                        property_id = "scale_x",
                        start_value = 1,
                    },
                    {
                        duration = 1,
                        easing = "outsine",
                        end_value = 1,
                        key_type = "tween",
                        node_id = "text",
                        property_id = "color_a",
                    },
                    {
                        duration = 1,
                        easing = "outquint",
                        end_value = 1,
                        key_type = "tween",
                        node_id = "underline",
                        property_id = "scale_x",
                    },
                },
                duration = 1,
            },
            {
                animation_id = "hide",
                animation_keys = {
                    {
                        duration = 1,
                        easing = "outsine",
                        key_type = "tween",
                        node_id = "text",
                        property_id = "color_a",
                        start_value = 1,
                    },
                    {
                        duration = 1,
                        easing = "inoutquad",
                        key_type = "tween",
                        node_id = "underline",
                        property_id = "scale_x",
                        start_value = 1,
                    },
                },
                duration = 1,
                initial_state = "show",
            },
        },
        metadata = {
            fps = 60,
            gizmo_steps = {
            },
            gui_path = "Assets/UI/location/location.gui",
            layers = {
            },
            settings = {
                font_size = 40,
            },
            template_animation_paths = {
            },
        },
        nodes = {
        },
    },
    format = "json",
    type = "animation_editor",
    version = 1,
}