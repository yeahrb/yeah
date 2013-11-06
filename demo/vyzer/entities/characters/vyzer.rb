class Vyzer < Character
  # See Character entity.

  # visual :shootguy_visual (implicit)

  def update
    run if pressing? :d, :a
    jump if pressing? :w

    super
  end

  def run
    pressing? :d, :a { |d| velocity.x += speed * d }
    @state = :run
  end
end
