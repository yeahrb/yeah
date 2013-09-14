class Yeah::Rectangle
  attr_accessor :size, :color

  def initialize(size=Yeah::Vector[], color=Color[*[255]*4])
    @size = size
    @color = color
  end

  def draw
    surface = Yeah::Surface.new(size)
    surface.fill(color)
    surface
  end
end
