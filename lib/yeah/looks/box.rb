module Yeah

class Box < Look
  def self.color
    @color
  end
  def self.color=(value)
    @color = value
  end

  def initialize(size = nil, color = nil)
    self.size = size if size

    self.color = self.class.color if self.class.color
    self.color = color if color
  end

  def color
    @color ||= Color[0, 0, 0]
  end
  def color=(value)
    @color = Color[value]
  end

  def render
    screen.color(color)
    screen.translate(thing.position)
    screen.rectangle(anchor * -1, thing.size)
  end
end

end
