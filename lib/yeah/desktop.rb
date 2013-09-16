require 'rubygame'

class Yeah::Desktop
  attr_reader :screen, :resolution

  def initialize(resolution=Yeah::Vector[320, 240])
    self.resolution = resolution
    @clock = Rubygame::Clock.new
  end

  def resolution=(value)
    @screen = Rubygame::Screen.new(value.components[0..1])
    @resolution = value
  end

  def render(surface)
    struct = screen.send(:struct)
    struct.pixels.write_string(surface.data, surface.data.length)
    screen.update
  end

  def each_tick
    loop do
      yield
      @clock.tick
    end
  end
end
