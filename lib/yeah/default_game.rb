module Yeah
class DefaultGame < Game
  def setup
    display.fill = C['#00ff99']
    draw_background

    display.fill = C['#0099ff']
    draw_face
  end

  def update(elapsed)
    draw_square(elapsed * 100)
  end

  def draw_background
    display.rectangle(V[0, 0], display.size)
  end

  def draw_face
    center = display.size / 2

    display.rectangle(center + V[-200, -200], V[100, 200])
    display.rectangle(center + V[ 200, -200], V[100, 200])
    display.rectangle(center + V[-300,  200], V[700, 100])
    display.rectangle(center + V[ 300,  100], V[100, 200])
    display.rectangle(center + V[-300,  100], V[100, 200])
  end

  def draw_square(length)
    position = V[rand * display.size.x, rand * display.size.y]
    display.rectangle(position, V[length, length])
  end
end
end
