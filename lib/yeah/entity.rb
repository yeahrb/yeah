class Yeah::Entity
  attr_accessor :position

  def initialize(*position)
    self.position = Yeah::Vector[*position]
  end
end
