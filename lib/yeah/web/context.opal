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

    @gl.enable(@gl.DEPTH_TEST)

    @mat4 = Native::Object.new(`mat4`)
    @mv_matrix = @mat4.create
    @p_matrix = @mat4.create
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
    @mat4.perspective(45, @canvas.width / @canvas.height, 0.1, 100, @p_matrix)

    @mat4.identity(@mv_matrix)

    square_vertex_pos_buffer = @gl.createBuffer
    @gl.bindBuffer(@gl.ARRAY_BUFFER, square_vertex_pos_buffer)
    square_vertices = [
       1,  1, 0,
      -1,  1, 0,
       1, -1, 0,
      -1, -1, 0
    ]
    gl_square_vertices = Native::Object.new(`new Float32Array(#{square_vertices})`)
    @gl.bufferData(@gl.ARRAY_BUFFER, gl_square_vertices, @gl.STATIC_DRAW)

    square_vertex_col_buffer = @gl.createBuffer
    @gl.bindBuffer(@gl.ARRAY_BUFFER, square_vertex_col_buffer)
    square_colors = [1, 0.3, 0.3, 1] * 4
    gl_square_colors = Native::Object.new(`new Float32Array(#{square_colors})`)
    @gl.bufferData(@gl.ARRAY_BUFFER, gl_square_colors, @gl.STATIC_DRAW)

    @mat4.translate(@mv_matrix, @mv_matrix, [-1, -1, 0])

    @gl.bindBuffer(@gl.ARRAY_BUFFER, square_vertex_pos_buffer)
    @gl.vertexAttribPointer(@vertex_pos_attr, 3, @gl.FLOAT, false, 0, 0)

    @gl.bindBuffer(@gl.ARRAY_BUFFER, square_vertex_col_buffer)
    @gl.vertexAttribPointer(@vertex_col_attr, 4, @gl.FLOAT, false, 0, 0)

    @gl.uniformMatrix4fv(@p_matrix_unif, false, @p_matrix)
    @gl.uniformMatrix4fv(@mv_matrix_unif, false, @mv_matrix)

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
    @gl.useProgram(@shader_program)

    @vertex_pos_attr = @gl.getAttribLocation(@shader_program, 'a_vertex_position')
    @gl.enableVertexAttribArray(@vertex_pos_attr)

    @vertex_col_attr = @gl.getAttribLocation(@shader_program, 'a_vertex_color')
    @gl.enableVertexAttribArray(@vertex_col_attr)

    @p_matrix_unif = @gl.getUniformLocation(@shader_program, 'u_p_matrix')
    @mv_matrix_unif = @gl.getUniformLocation(@shader_program, 'u_mv_matrix')
  end
end

end
end
