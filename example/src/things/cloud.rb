require 'looks/cloud_look' #

class Cloud < Yeah::Thing #
#class Cloud < Thing
  self.look = CloudLook #

  def act(input, space, elapsed)
    self.x -= 10 * elapsed
  end
end
