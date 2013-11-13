class Training < Map
  key {
    '#' => Wall,
    '@' => Shootguy
  }

  # tile_size Wall.new.size (implicit)

  tiles [
    "################",
    "#              #",
    "#  ###    ###  #",
    "#              #",
    "# @            #",
    "################"
  ]
end
