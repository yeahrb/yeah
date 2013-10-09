class Character < Entity
  attr_accessor :position, :velocity
  # attr_accessor :x, :y, :z, :speed, :direction # implicit
  # magic_attrs true # implicit

  def update
    # face visual left or right
    self.face = velocity.x

    # velocity.x's range is (-5, 5)
    velocity.x.limit 5

    # #position += #velocity
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
