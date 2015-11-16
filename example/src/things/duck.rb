require 'yeah/thing' #
require 'looks/duck_look' #

class Duck < Yeah::Thing #
#class Duck < Thing
  self.look = DuckLook #

  def act(input, space)
    self.x += 3
    puts "Quack" if rand > 0.5
  end
end
