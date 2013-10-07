class Shootguy < Character
  # See Character entity.

  # visual :shootguy_visual (implicit)

  def update
    # control horizontal velocity with D/A keys in increments of 1
    control(velocity.x).with(:d, :a).by(1)

    # run state if pressing D or A
    self.state = :run if pressing? :d, :a

    # call #jump if pressing W
    jump if pressing? :w

    # Character's #update
    super
  end
end
