# Happy Rectangle
# A barebones demo for Yeah.

lib = File.expand_path('../../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'yeah'
include Yeah

class HappyRectangle < Entity
  def initialize(position)
    super position
    @visual = Rectangle.new(Vector[16, 24], Color[255, 255, 0, 255])
    @updates = 0
    @radius = 60
    @center = (Game.new.resolution - @visual.size) / 2
  end

  def update
    @updates += 1
    @position.x = @center.x + (Math.cos(@updates) * @radius).floor
    @position.y = @center.y + (Math.sin(@updates) * @radius).floor
  end
end

class HappyRectangleGame < Game
  def initialize
    super
    @updates = 0
    @entities << HappyRectangle.new(resolution/2)
  end

  def update
    super
    @updates += 1
    puts "#{@updates}/60 updates."
    abort if @updates == 60
  end
end

g = HappyRectangleGame.new
g.start
