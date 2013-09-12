class Yeah::Surface
  attr_reader :size, :pixels

  def initialize(size)
    self.size = size
  end

  def size=(value)
    @size = value
    @pixels = "\x00\x00\x00\xFF" * size.x * size.y
  end
end
