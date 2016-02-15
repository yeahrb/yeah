class GuyLook < Yeah::SpriteLook #
#class GuyLook < SpriteLook
  self.image = Yeah::Image['guy.png'] #
  self.size = 64, 64
  self.speed = 15

  self.animations = {
    stand_up: 0,
    stand_left: 9,
    stand_down: 18,
    stand_right: 27,
    walk_up: (0..8),
    walk_left: (9..17),
    walk_down: (18..26),
    walk_right: (27..35)
  }
end
