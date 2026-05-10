components {
  id: "map"
  component: "/Levels/level3/level3.tilemap"
}
embedded_components {
  id: "collisionobject"
  type: "collisionobject"
  data: "collision_shape: \"/Levels/level3/level3.tilemap\"\n"
  "type: COLLISION_OBJECT_TYPE_STATIC\n"
  "mass: 0.0\n"
  "friction: 0.1\n"
  "restitution: 0.5\n"
  "group: \"default\"\n"
  "mask: \"default\"\n"
  "mask: \"fruit\"\n"
  ""
}
