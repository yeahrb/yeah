module Yeah
module Web

class Context
  include Opal

  def initialize
    @canvas = Native::Object.new(`document.getElementsByTagName('canvas')[0]`)
    @gl = @canvas.getContext('webgl')
  end

  def background(*color)
    color = Color[color].rgb

    @gl.clearColor(*color, 1)
    @gl.clear(@gl.COLOR_BUFFER_BIT)
  end
end

end
end
