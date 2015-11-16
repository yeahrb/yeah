require 'spaces/world' #

class Example < Yeah::Game
#class Example < Game
  display.size = 640, 360
  self.space = World
end
