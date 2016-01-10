require 'yeah/sprite_look' #

class GuyLook < Yeah::SpriteLook #
#class GuyLook < ImageLook
  self.image = "guy.png" #
  self.size = 64, 64

  self.animations = {
    walk_up: (0..8),
    walk_left: (9..17),
    walk_down: (18..26),
    walk_right: { frames: (27..35), mirror_x: false },
    stand_up: 0,
    stand_left: 9,
    stand_down: 18,
    stand_right: 27
  }
end
