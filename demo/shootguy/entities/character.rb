class Character < Entity
  attr_accessor :position, :velocity
  # attr_accessor :x, :y, :z, :speed, :direction # implicit
  # magic_attrs true # implicit

  def update
    # velocity.x = 5 if velocity.x > 5
    limit velocity.x, 5

    # face visual in the direction of horizontal velocity
    self.face = velocity.x

    # add position to velocity
    move

    # unintersect from any Wall
    unintersect Wall
  end

  def jump
    # if Wall is right below...
    if touching? Wall, :below

      # jump!
      self.state = :jump
      self.speed.y += 5
    end
  end
end
