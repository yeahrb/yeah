class Follower < Thing
  def update
    self.position = mouse.position
    self.position.x -= size.x / 2
  end

  def charged?
    mouse.left_clicked?
  end
end
