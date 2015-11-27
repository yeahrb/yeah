require 'spaces/world' #

class Game < Yeah::Game
  self.title = "Example Game"
  display.size = 640, 360
  self.space = World
end
