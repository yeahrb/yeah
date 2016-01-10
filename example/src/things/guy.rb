require 'yeah/thing' #
require 'looks/guy_look' #

class Guy < Yeah::Thing
#class Guy < Thing
  self.look = GuyLook #

  def act(elapsed)
    walked = false

    if keyboard.pressing? :left
      look.animation = :walk_left
      self.x -= speed * elapsed
      walked = true
    end

    if keyboard.pressing? :right
      look.animation = :walk_right
      self.x += speed * elapsed
      walked = true
    end

    if keyboard.pressing? :down
      look.animation = :walk_down
      self.y -= speed * elapsed
      walked = true
    end

    if keyboard.pressing? :up
      look.animation = :walk_up
      self.y += speed * elapsed
      walked = true
    end

    unless walked
      look.animation = :stand_left if keyboard.released? :left
      look.animation = :stand_right if keyboard.released? :right
      look.animation = :stand_down if keyboard.released? :down
      look.animation = :stand_up if keyboard.released? :up
    end
  end

  def speed
    50
  end
end
