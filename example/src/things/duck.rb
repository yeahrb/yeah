require 'yeah/thing' #
require 'looks/duck_look' #

class Duck < Yeah::Thing #
#class Duck < Thing
  self.look = DuckLook #

  def act(input, space, elapsed)
    self.x += 30 * elapsed
  end
end
