class Follower < Thing
  def update
    self.position = mouse.position
    self.position.x -= size.x / 2 # TODO: use anchor for this sort of thing

    if mouse.left_clicked? && !@clicking
      @clicking = true
      Wanderer.new(space: space, position: position)
    end

    @clicking = false unless mouse.left_clicked?
  end

  def charged?
    mouse.left_clicked?
  end
end
