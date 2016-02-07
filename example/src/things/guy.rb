require 'looks/guy_look' #

class Guy < Yeah::Thing
#class Guy < Thing
  self.look = GuyLook #

  def act(elapsed)
    walking = false

    if keyboard.pressing? :right
      self.x += speed * elapsed
      look.animation = :walk_right if keyboard.pressed? :right
      walking = true
    end

    if keyboard.pressing? :left
      self.x -= speed * elapsed
      look.animation = :walk_left if keyboard.pressed? :left
      walking = true
    end

    if keyboard.pressing? :up
      self.y += speed * elapsed
      look.animation = :walk_up if keyboard.pressed? :up
      walking = true
    end

    if keyboard.pressing? :down
      self.y -= speed * elapsed
      look.animation = :walk_down if keyboard.pressed? :down
      walking = true
    end

    unless walking
      look.animation = :stand_right if keyboard.released? :right
      look.animation = :stand_left if keyboard.released? :left
      look.animation = :stand_up if keyboard.released? :up
      look.animation = :stand_down if keyboard.released? :down
    end

  end

  def speed
    50
  end
end
