class Character < Thing
  def setup
    @direction = V[1, 1]
    @updates = 0
  end

  def update
    @updates += 1

    @direction[0] *= -1 if @updates % 150 == 0
    @direction[1] *= -1 if @updates % 200 == 0

    self.position += @direction
  end
end
