module Yeah

class Box < Invisible
  def self.color
    @color
  end
  def self.color=(value)
    @color = value
  end

  def initialize(size = nil, color = Color[0, 0, 0])
    self.size = size if size
    self.color = self.class.color || color
  end

  attr_accessor :color

  def render(context, position)
    context.color(color)
    context.rectangle(position, size)
  end
end

end
