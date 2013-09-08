class Yeah::Rectangle
  attr_accessor :size, :color

  def initialize(size=Yeah::Vector[], color=[255]*4)
    @size = size
    @color = color
  end
end
