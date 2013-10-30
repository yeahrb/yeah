module Yeah::BasicPhysics
  attr_writer :velocity

  def velocity
    @velocity ||= Vector[0, 0, 0]
  end

  def move
    self.position += @velocity
  end
end
