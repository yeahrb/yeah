class Follower < Thing
  def update
    self.position = mouse.position
    self.position.x -= size.x / 2 # TODO: use anchor for this sort of thing

    if mouse.left_clicking? && !@clicking
      @clicking = true
      Wanderer.new(space: space, position: position)
    end

    @clicking = false unless mouse.left_clicking?
  end

  def charged?
    mouse.left_clicking?
  end
end
