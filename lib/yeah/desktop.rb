require 'rubygame'

class Yeah::Desktop
  attr_accessor :game

  def initialize
    @screen = Rubygame::Screen.new([320, 240])
  end
end
