class Training < Map
  key {
    '#' => Wall,
    '@' => Yugo
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
