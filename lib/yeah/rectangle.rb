class Yeah::Rectangle
  def initialize(size=Yeah::Vector[], color=[255]*4)
    @size = size
    @color = color
  end

  def size
    @size
  end

  def size=(value)
    @size = value
  end

  def color
    @color
  end

  def color=(value)
    @color = value
  end
end
