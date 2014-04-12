class Follower < Thing
  def update
    self.position = mouse.position

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
