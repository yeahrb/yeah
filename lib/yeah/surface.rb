class Yeah::Surface
  attr_reader :size

  def initialize(size)
    @size = size
  end

  def size=(value)
    @size = value
  end
end
