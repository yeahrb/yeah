require 'looks/guy_look' #

class Guy < Yeah::Thing
#class Guy < Thing
  self.look = GuyLook #

  def act(elapsed)
    look.walking = false

    if keyboard.pressing? :right
      self.x += speed * elapsed
      look.direction = :right
      look.walking = true
    end

    if keyboard.pressing? :left
      self.x -= speed * elapsed
      look.direction = :left
      look.walking = true
    end

    if keyboard.pressing? :up
      self.y += speed * elapsed
      look.direction = :up
      look.walking = true
    end

    if keyboard.pressing? :down
      self.y -= speed * elapsed
      look.direction = :down
      look.walking = true
    end
  end

  def speed
    50
  end
end
