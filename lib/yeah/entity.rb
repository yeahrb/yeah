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

  def y
    position.y
  end

  def y=(value)
    self.position.y = value
  end

  def z
    position.z
  end

  def z=(value)
    self.position.z = value
  end
end
