require 'rubygame'

class Yeah::Desktop
  attr_reader :screen, :resolution

  def initialize
    @resolution = Yeah::Vector[320, 240]
    @screen = Rubygame::Screen.new([320, 240])
  end

  def resolution=(value)
    @screen = Rubygame::Screen.new(value.components[0..1])
    @resolution = value
  end
end
