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
    screen.fill(Color[0, 0, 0, 0])
    @entities.each do |entity|
      surface = entity.draw
      screen.draw(surface, entity.position) unless surface.nil?
    end
    pixels = platform.screen.send(:struct).pixels
    pixels.write_string(screen.data, screen.data.length)
    platform.screen.update
  end

  def start
    platform.each_tick do
      update
      draw
    end
  end
end
