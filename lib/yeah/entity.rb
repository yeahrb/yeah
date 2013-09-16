class Yeah::Entity
  attr_accessor :position, :visual

  def initialize(position=Vector[])
    @position = position
  end

  def x
    @position.x
  end

  def x=(value)
    @position.x = value
  end

  def y
    @position.y
  end

  def y=(value)
    @position.y = value
  end

  def z
    @position.z
  end

  def z=(value)
    @position.z = value
  end

  def draw
    visual.draw if visual
  end
end
