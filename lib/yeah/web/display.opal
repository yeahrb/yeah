module Yeah
module Web
class Display
  def initialize(args = {})
    @canvas = `document.querySelectorAll(#{args.fetch(:canvas_selector)})[0]`
    @context = `#@canvas.getContext('2d')`

    self.size = args.fetch(:size)
  end

  def size
    V[`#@canvas.width`, `#@canvas.height`]
  end
  def size=(value)
    `#@canvas.width =  #{value.x}`
    `#@canvas.height = #{value.y}`
  end

  def color_at(position)
    data = `#@context.getImageData(#{position.x}, #{position.y}, 1, 1).data`
    C[`data[0]`, `data[1]`, `data[2]`]
  end

  def clear
    `#@context.fillStyle = '#000'`
    `#@context.fillRect(0, 0, #{size.x}, #{size.y})`
  end

  def fill(position, size, color)
  end
end
end
end
