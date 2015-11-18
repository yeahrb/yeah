require 'things/duck' #
require 'things/cloud' #

class World < Yeah::Space #
#class World < Space
  self.size = 640, 360
  self.clear_color = 0.5, 0.7, 0.5

  def initialize
    super

    things << Cloud.new(x: width * 0.6, y: height * 0.8)
    things << Cloud.new(x: width * 0.2, y: height * 0.7)
    things << Cloud.new(x: width * 0.1, y: height * 0.9)
    things << Duck.new(x: 10, y: 10)
    #things << Duck.new(position: Vec2.divide(size, 2))
  end
end