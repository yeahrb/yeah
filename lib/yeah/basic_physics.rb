module Yeah::BasicPhysics
  include Yeah

  def velocity
    @velocity ||= V[0, 0, 0]
  end
  attr_writer :velocity

  def move
    self.position += self.velocity
  end
end
