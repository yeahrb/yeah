module Yeah
module Web

class Context
  include Opal

  VERTEX_SHADER = <<-glsl
    attribute vec3 a_vertex_position;
    attribute vec4 a_vertex_color;

    uniform mat4 u_mv_matrix;
    uniform mat4 u_p_matrix;

    varying vec4 v_color;

    void main(void) {
      gl_Position = u_p_matrix * u_mv_matrix * vec4(a_vertex_position, 1.0);
      v_color = a_vertex_color;
    }
  glsl

  FRAGMENT_SHADER = <<-glsl
    precision mediump float;

    varying vec4 v_color;

    void main(void) {
      gl_FragColor = v_color;
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
    background(level.background)
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
    @gl.useProgram(@shader_program)
  end
end

end
end
