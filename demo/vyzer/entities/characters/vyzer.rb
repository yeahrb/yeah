class Vyzer < Character
  # See Character entity.

  # visual :shootguy_visual (implicit)

  def update
    run if pressing? :d, :a
    jump if pressing? :w

    super
  end

  def run
    control 'velocity.x', [:d, :a], 2
    @state = :run
  end
end
