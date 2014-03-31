module Yeah

class Box
  def self.size
    @size
  end
  def self.size=(value)
    @size = value
  end

  def self.color
    @color
  end
  def self.color=(value)
    @color = value
  end

  def initialize(size = V[], color = Color[0, 0, 0])
    self.size = self.class.size || size
    self.color = self.class.color || color
  end

  attr_accessor :size

  attr_accessor :color

  def render(context, position)
    context.color(color)
    context.rectangle(position, size)
  end
end

end
