require 'yeah/thing' #
require 'looks/duck_look' #

class Duck < Yeah::Thing #
#class Duck < Thing
  self.look = DuckLook #

  def act(input, space)
    puts "Quack" if rand > 0.8
  end
end
