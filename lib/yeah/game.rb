class Yeah::Game
  attr_accessor :entities, :screen, :platform, :resolution

  def initialize
    @resolution = Yeah::Vector[320, 240]
    @screen = Yeah::Surface.new(@resolution)
    @platform = Yeah::Desktop.new
    @entities = []
  end

  def update
    @entities.each { |e| e.update }
  end

  def draw
    @entities.each { |e| e.draw }
  end
end
