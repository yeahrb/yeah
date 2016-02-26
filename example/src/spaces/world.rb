require 'things/cloud' #
require 'things/duck' #
require 'things/guy' #

class World < Yeah::Space #
#class World < Space
  self.size = 640, 360
  self.color = 0.5, 0.7, 0.5

  self.things = {
    Cloud => [
      [384, 288],
      [128, 252],
      [64, 324]
    ],
    Duck => [
      [10, 10]
    ],
    Guy => [
      [512, 288]
    ]
  }
end
