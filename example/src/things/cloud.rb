require 'looks/cloud_look' #

class Cloud < Yeah::Thing #
#class Cloud < Thing
  self.look = CloudLook #

  def act(input, space)
    self.x -= 1
  end
end
