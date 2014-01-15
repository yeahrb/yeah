module Position
  def coordinates
    @coordinates ||= V[]
  end
  attr_writer :coordinates

  def x; coordinates[0]; end
  def x=(v); self.coordinates[0] = v; end

  def y; coordinates[1]; end
  def y=(v); self.coordinates[1] = v; end

  def z; coordinates[2]; end
  def z=(v); self.coordinates[2] = v; end
end
