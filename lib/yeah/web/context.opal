module Yeah
module Web

class Context
  include Opal

  VERTEX_SHADER = <<-glsl
    attribute vec2 a_position;

    void main(void) {
      gl_Position = vec4(a_position, 0, 1);
    }
  glsl

  FRAGMENT_SHADER = <<-glsl
    precision mediump float;

    void main(void) {
      gl_FragColor = vec4(0.2, 0.8, 0.2, 1.0);
    }
  glsl

  def initialize
    @canvas = Native::Object.new(`document.getElementsByTagName('canvas')[0]`)
    @gl = @canvas.getContext('webgl')

    setup_shaders
  end

  def resolution
    V[@canvas.width, @canvas.height]
  end
  def resolution=(value)
    value = V[value]

    @canvas.width = value[0]
    @canvas.height = value[1]
  end

  def each_tick(&block)
    yield
  end

  def render(level)
    @gl.viewport(0, 0, @canvas.width, @canvas.height)

    background(level.background)

    test
  end

  def test
    pos_buffer = @gl.createBuffer
    @gl.bindBuffer(@gl.ARRAY_BUFFER, pos_buffer)
    vertices = [
       1,  1,
      -1,  1,
       1, -1,
      -1, -1
    ]
    gl_vertices = Native::Object.new(`new Float32Array(#{vertices})`)
    @gl.bufferData(@gl.ARRAY_BUFFER, gl_vertices, @gl.STATIC_DRAW)
    @gl.vertexAttribPointer(@pos_attr, 2, @gl.FLOAT, false, 0, 0)
    @gl.drawArrays(@gl.TRIANGLE_STRIP, 0, 4)
  end

  def background(*color)
    rgb = Color[*color].rgb

    @gl.clearColor(*rgb, 1)
    @gl.clear(@gl.COLOR_BUFFER_BIT)
  end

  private

  def setup_shaders
    @shader_program = @gl.createProgram

    vertex_shader = @gl.createShader(@gl.VERTEX_SHADER)
    @gl.shaderSource(vertex_shader, VERTEX_SHADER)
    @gl.compileShader(vertex_shader)
    @gl.attachShader(@shader_program, vertex_shader)

    fragment_shader = @gl.createShader(@gl.FRAGMENT_SHADER)
    @gl.shaderSource(fragment_shader, FRAGMENT_SHADER)
    @gl.compileShader(fragment_shader)
    @gl.attachShader(@shader_program, fragment_shader)

    @gl.linkProgram(@shader_program)
    linked = @gl.getProgramParameter(@shader_program, @gl.LINK_STATUS)
    if !linked
      error = @gl.getProgramInfoLog(@shader_program)
      puts "GL program link error: #{error}"
      return
    end

    @gl.useProgram(@shader_program)

    @pos_attr = @gl.getAttribLocation(@shader_program, 'a_position')
    @gl.enableVertexAttribArray(@pos_attr)
  end
end

end
end
