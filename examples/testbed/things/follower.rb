class Follower < Thing
  def update
    self.position = game.context.mouse.position
  end
end
