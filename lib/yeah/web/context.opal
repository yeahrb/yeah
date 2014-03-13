module Yeah
module Web

class Context
  include Opal

  def initialize
    @canvas = Native::Object.new(`document.getElementsByTagName('canvas')[0]`)
    @gl = @canvas.getContext('webgl')
  end

  def each_tick(&block)
    yield
  end

  def render(level)
    background(level.background)
  end

  def background(*color)
    rgb = Color[*color].rgb

    @gl.clearColor(*rgb, 1)
    @gl.clear(@gl.COLOR_BUFFER_BIT)
  end
end

end
end
