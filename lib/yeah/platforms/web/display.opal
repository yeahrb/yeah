module Yeah
module Web
class Display
  def initialize(args = {})
    @canvas = `document.querySelectorAll(#{args.fetch(:canvas_selector)})[0]`
    @context = `#@canvas.getContext('2d')`

    @canvas.size = args.fetch(:size)
  end

  def size
    V[`#@canvas.width`, `#@canvas.height`]
  end
  def size=(value)
    `#@canvas.width =  #{value.x}`
    `#@canvas.height = #{value.y}`
  end

  def color_at(position)
    C[1, 1, 1]
  end

  def clear
  end

  def fill(position, size, color)
  end
end
end
end
