class Follower < Thing
  def update
    self.position = game.context.mouse.position
    self.position.x -= size.x / 2
  end
end
