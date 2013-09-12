class Yeah::Surface
  attr_reader :size, :data

  def initialize(size)
    self.size = size
  end

  def size=(value)
    @size = value
    @data = "\x00\x00\x00\xFF" * size.x * size.y
  end

  def color_at(position)
    Color[]
  end
end
