components {
  id: "script"
  component: "/orthographic/camera.script"
  properties {
    id: "near_z"
    value: "-40.0"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "far_z"
    value: "1000.0"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "zoom"
    value: "7.0"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "follow"
    value: "true"
    type: PROPERTY_TYPE_BOOLEAN
  }
  properties {
    id: "follow_target"
    value: "/player/character"
    type: PROPERTY_TYPE_HASH
  }
  properties {
    id: "follow_offset"
    value: "10.0, -20.0, 0.0"
    type: PROPERTY_TYPE_VECTOR3
  }
}
embedded_components {
  id: "camera"
  type: "camera"
  data: "aspect_ratio: 1.0\n"
  "fov: 0.7854\n"
  "near_z: -50.0\n"
  "far_z: 1000.0\n"
  "orthographic_projection: 1\n"
  "orthographic_zoom: 4.0\n"
  ""
}
