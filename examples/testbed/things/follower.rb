class Follower < Thing
  def update
    self.position = mouse.position
    self.position.x -= size.x / 2 # TODO: use anchor for this sort of thing
  end

  def charged?
    mouse.left_clicked?
  end
end
