module Yeah
module Web

class Screen
  include Opal

  VERTEX_SHADER = <<-glsl
    attribute vec2 a_position;

    uniform vec2 u_resolution;

    void main(void) {
      vec2 clipspace = a_position / u_resolution * 2.0 - 1.0;

      gl_Position = vec4(clipspace, 0, 1);
    }
  glsl

  FRAGMENT_SHADER = <<-glsl
    precision mediump float;

    uniform vec3 u_color;

    void main(void) {
      gl_FragColor = vec4(u_color, 1.0);
    }
  glsl

  def initialize
    @canvas = Native::Object.new(`document.getElementsByTagName('canvas')[0]`)
    @gl = @canvas.getContext('webgl')

    setup_shaders
  end

  attr_reader :canvas

  def resolution
    V[@canvas.width, @canvas.height]
  end
  def resolution=(value)
    value = V[value]

    @canvas.width = value[0]
    @canvas.height = value[1]
  end

  def render(space)
    @gl.viewport(0, 0, @canvas.width, @canvas.height)

    background(space.background)

    space.things.each do |thing|
      thing.visual.render(self, thing.position)
    end
  end

  def background(*color)
    rgb = Color[*color].rgb

    @gl.clearColor(*rgb, 1)
    @gl.clear(@gl.COLOR_BUFFER_BIT)
  end

  def color(color)
    @gl.uniform3f(@col_loc, *color.rgb)
  end

  def rectangle(position, size)
    res = @gl.getUniformLocation(@shader_program, 'u_resolution')
    @gl.uniform2f(res, resolution[0], resolution[1])

    rect = {
      left: position[0],
      bottom: position[1],
      width: size[0],
      height: size[1]
    }
    vertices = [
      rect[:left], rect[:bottom],
      rect[:left], rect[:bottom] + rect[:height],
      rect[:left] + rect[:width], rect[:bottom],
      rect[:left] + rect[:width], rect[:bottom] + rect[:height]
    ]

    pos_buffer = @gl.createBuffer
    @gl.bindBuffer(@gl.ARRAY_BUFFER, pos_buffer)
    gl_vertices = Native::Object.new(`new Float32Array(#{vertices})`)
    @gl.bufferData(@gl.ARRAY_BUFFER, gl_vertices, @gl.STATIC_DRAW)
    @gl.vertexAttribPointer(@pos_loc, 2, @gl.FLOAT, false, 0, 0)

    @gl.drawArrays(@gl.TRIANGLE_STRIP, 0, 4)
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

    @pos_loc = @gl.getAttribLocation(@shader_program, 'a_position')
    @gl.enableVertexAttribArray(@pos_loc)

    @col_loc = @gl.getUniformLocation(@shader_program, 'u_color')
  end
end

end
end
