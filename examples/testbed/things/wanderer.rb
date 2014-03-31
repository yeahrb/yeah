class Wanderer < Thing
  def setup
    @direction = V[1, 1]
    @updates = 0
  end

  def update
    @updates += 1

    @direction.x *= -1 if @updates % 150 == 0
    @direction.y *= -1 if @updates % 200 == 0

    self.position += @direction
  end
end
