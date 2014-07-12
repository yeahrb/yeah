module Yeah
class DefaultGame < Game
  def setup
    display.fill = C['#ff0099']
    draw_background

    display.fill = C['#9900ff']
    draw_face
  end

  def update(elapsed)
    draw_square(elapsed * 100)
  end

  def draw_background
    display.rectangle(V[0, 0], display.size)
  end

  def draw_face
    center = V[display.size.x / 2, display.size.y / 2]

    display.rectangle(V[center.x - 200, center.y - 200], V[100, 200])
    display.rectangle(V[center.x + 200, center.y - 200], V[100, 200])
    display.rectangle(V[center.x - 300, center.y + 200], V[700, 100])
    display.rectangle(V[center.x + 300, center.y + 100], V[100, 200])
    display.rectangle(V[center.x - 300, center.y + 100], V[100, 200])
  end

  def draw_square(length)
    position = V[rand * display.size.x, rand * display.size.y]
    display.rectangle(position, V[length, length])
  end
end
end
