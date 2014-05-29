module Yeah
module Web
class Display
  def initialize(*kargs)
    @canvas = `document.querySelectorAll(#{kargs.fetch(:canvas)})[0]`
    @context = `#@canvas.getContext('webgl')`

    @canvas.size = kargs.fetch(:size)
  end

  def size
    V[`#@canvas.width`, `#@canvas.height`]
  end
  def size=(value)
    `#@canvas.width =  #{value.x}`
    `#@canvas.height = #{value.y}`
  end

  def pixel_at(position)
    C[1, 1, 1]
  end

  def clear
  end

  def rect
  end
end
end
end
