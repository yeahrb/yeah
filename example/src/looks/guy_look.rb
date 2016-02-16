class GuyLook < Yeah::SpriteLook #
#class GuyLook < SpriteLook
  attr_accessor :walking, :direction

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

  def animation
    if walking
      case direction
      when :right
        :walk_right
      when :left
        :walk_left
      when :up
        :walk_up
      when :down
        :walk_down
      end
    else
      case direction
      when :right
        :stand_right
      when :left
        :stand_left
      when :up
        :stand_up
      when :down
        :stand_down
      else
        :stand_down
      end
    end
  end
end
