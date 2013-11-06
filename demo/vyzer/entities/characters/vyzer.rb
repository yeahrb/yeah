class Vyzer < Character
  # See Character entity.

  # visual :shootguy_visual (implicit)

  def update
    run if pressing? :d, :a
    jump if pressing? :w

    super
  end

  def run
    control 'velocity.x', with: [:d, :a], by: 1
    @state = :run
  end
end
