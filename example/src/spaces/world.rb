require 'things/cloud' #
require 'things/duck' #
require 'things/guy' #

class World < Yeah::Space #
#class World < Space
  self.size = 640, 360
  self.color = 0.5, 0.7, 0.5

  self.things = {
    Cloud => [
      -> { [width * 0.6, height * 0.8] },
      -> { [width * 0.2, height * 0.7] },
      -> { [width * 0.1, height * 0.9] }
    ],

    Duck => [
      [10, 10]
    ],

    Guy => [
      -> { [width * 0.8, height * 0.8] }
    ]
  }

  def initialize(game)
    super

    things << Cloud.new(game, x: width * 0.6, y: height * 0.8)
    things << Cloud.new(game, x: width * 0.2, y: height * 0.7)
    things << Cloud.new(game, x: width * 0.1, y: height * 0.9)
    things << Duck.new(game, x: 10, y: 10)
    things << Guy.new(game, x: width * 0.8, y: height * 0.8)
    #things << Duck.new(game, position: Vec2.divide(size, 2))
  end
end
