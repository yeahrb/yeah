# Colored rectangle Visual.
class Yeah::Rectangle
  def initialize(size=V[], color=Color[*[255]*4])
    @size = size
    @color = color
  end

  # @!attribute size
  #   @return [Vector]
  attr_accessor :size

  # @!attribute color
  #   @return [Color]
  attr_accessor :color

  # Surface representation.
  # @return [Surface]
  def draw
    surface = Surface.new(size)
    surface.fill(color)
    surface
  end
end
