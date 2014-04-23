module Yeah

class Box < Look
  class_attr :color, Color[]

  def initialize(size = nil, color = nil)
    self.size = size if size
    self.color = color if color
  end

  def color=(value)
    super(Color[value])
  end

  def render
    screen.color(color)
    screen.translate(thing.position)
    screen.rectangle(anchor * -1, thing.size)
  end
end

end
