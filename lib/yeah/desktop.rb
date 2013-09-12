require 'rubygame'

class Yeah::Desktop
  attr_reader :screen, :resolution

  def initialize(resolution=Yeah::Vector[320, 240])
    self.resolution = resolution
  end

  def resolution=(value)
    @screen = Rubygame::Screen.new(value.components[0..1])
    @resolution = value
  end
end
