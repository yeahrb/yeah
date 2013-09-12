require 'rubygame'

class Yeah::Desktop
  attr_reader :screen

  def initialize
    @screen = Rubygame::Screen.new([320, 240])
  end
end
