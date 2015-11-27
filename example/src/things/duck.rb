require 'yeah/thing' #
require 'looks/duck_look' #

class Duck < Yeah::Thing #
#class Duck < Thing
  self.look = DuckLook #

  def act(elapsed)
    if keyboard.pressing? :left
      self.x -= speed * elapsed
    end

    if keyboard.pressing? :right
      self.x += speed * elapsed
    end

    if keyboard.released? :space
      puts "Quack!"
    end
  end

  def speed
    30
  end
end
