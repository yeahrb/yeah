class Yeah::Surface
  attr_reader :size
  attr_accessor :data

  def initialize(size, color=Color[])
    @color = color
    self.size = size
  end

  def size=(value)
    @size = value
    @data = @color.rgba_bytes.pack('C*') * size.x * size.y
  end

  def color_at(position)
    @color
  end

  def draw_rectangle(position1, position2, color)
    @color = color
  end
end
