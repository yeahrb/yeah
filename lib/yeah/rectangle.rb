# Colored rectangle Visual.
class Yeah::Rectangle
  # @!attribute size
  #   @return [Vector]
  # @!attribute color
  #   @return [Color]
  attr_accessor :size, :color

  def initialize(size=Vector[], color=Color[*[255]*4])
    @size = size
    @color = color
  end

  # Surface representation.
  # @return [Surface]
  def draw
    surface = Surface.new(size)
    surface.fill(color)
    surface
  end
end
