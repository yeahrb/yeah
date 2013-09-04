class Yeah::Entity
  attr_accessor :position

  def initialize(*position)
    self.position = Yeah::Vector[*position]
  end

  def x
    position.x
  end

  def x=(value)
    self.position.x = value
  end
end
