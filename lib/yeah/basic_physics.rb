module Yeah::BasicPhysics
  attr_writer :velocity

  def velocity
    @velocity ||= V[0, 0, 0]
  end

  def move
    self.position += @velocity
  end
end
