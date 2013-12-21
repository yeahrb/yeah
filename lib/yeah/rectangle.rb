# Colored rectangle Visual.
class Yeah::Rectangle
  include Yeah

  def initialize(size=V[], color=Color[*[255]*4])
    @size = size
    @color = color
  end

  # @return [Vector]
  attr_accessor :size

  # @return [Color]
  attr_accessor :color

  # Surface representation.
  #
  # @return [Surface]
  def render
    surface = Surface.new(size)
    surface.fill(color)
    surface
  end
end
