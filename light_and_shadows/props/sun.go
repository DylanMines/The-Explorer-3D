components {
  id: "sun"
  component: "/light_and_shadows/sun.script"
  properties {
    id: "color"
    value: "0.0, 0.0, 0.0, 0.0"
    type: PROPERTY_TYPE_VECTOR4
  }
  properties {
    id: "shadow"
    value: "1.0, 1.0, 1.0, 0.0"
    type: PROPERTY_TYPE_VECTOR4
  }
  properties {
    id: "near"
    value: "0.1"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "far"
    value: "1000.0"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "perspective"
    value: "true"
    type: PROPERTY_TYPE_BOOLEAN
  }
  properties {
    id: "fov"
    value: "2.8"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "static"
    value: "false"
    type: PROPERTY_TYPE_BOOLEAN
  }
}
embedded_components {
  id: "label"
  type: "label"
  data: "size {\n"
  "  x: 50.0\n"
  "  y: 32.0\n"
  "}\n"
  "text: \"Sun\"\n"
  "font: \"/builtins/fonts/default.font\"\n"
  "material: \"/light_and_shadows/materials/hidden_label.material\"\n"
  ""
  position {
    y: 7.385
  }
  scale {
    x: 0.4
    y: 0.4
    z: 0.4
  }
}
embedded_components {
  id: "model"
  type: "model"
  data: "mesh: \"/light_and_shadows/props/bulb_dir.glb\"\n"
  "name: \"unnamed\"\n"
  "materials {\n"
  "  name: \"material_0\"\n"
  "  material: \"/light_and_shadows/materials/hidden_model/yellow.material\"\n"
  "}\n"
  ""
}
