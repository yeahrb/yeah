class Character < Entity
  include BasicPhysics # for #velocity and #move

  def update
    # face visual left or right
    self.face = velocity.x

    # velocity.x's range is (-5, 5)
    velocity.x.limit 5

    # #position += #velocity
    move

    # deintersect from any Wall
    deintersect Wall
  end

  def jump
    # if Wall is right below...
    if touching? Wall, :below

      # jump!
      self.state = :jump
      self.velocity.y += 5
    end
  end
end
