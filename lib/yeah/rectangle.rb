class Yeah::Rectangle
  def initialize(size=Yeah::Vector[])
    @size = size
  end

  def size
    @size ||= Yeah::Vector[]
  end

  def size=(value)
    @size = value
  end
end
