class Yeah::Surface
  attr_reader :size
  attr_accessor :data

  def initialize(size, color=Color[])
    self.size = size
    @color = color
  end

  def size=(value)
    @size = value
    @data = "\x00\x00\x00\xFF" * size.x * size.y
  end

  def color_at(position)
    @color
  end

  def draw_rectangle(position, rectangle)
    @color = rectangle.color
  end
end
