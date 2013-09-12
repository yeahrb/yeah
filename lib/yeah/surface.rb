class Yeah::Surface
  attr_reader :size
  attr_accessor :data

  def initialize(size, color=Color[])
    @color = color
    self.size = size
  end

  def size=(value)
    @size = value
    @data = @color.byte_array.pack('C*') * size.x * size.y
  end

  def color_at(position)
    @color
  end

  def draw_rectangle(position, rectangle)
    @color = rectangle.color
  end
end
