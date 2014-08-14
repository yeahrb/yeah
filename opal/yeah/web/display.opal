module Yeah
module Web
class Display
  attr_reader :font_type, :font_size

  def initialize(args = {})
    canvas_selector = args.fetch(:canvas_selector, DEFAULT_CANVAS_SELECTOR)

    @canvas = `document.querySelectorAll(#{canvas_selector})[0]`
    @context = `#@canvas.getContext('2d')`
    self.size = args.fetch(:size, DEFAULT_DISPLAY_SIZE)
    self.font_type = DEFAULT_DISPLAY_FONT_TYPE
    self.font_size = DEFAULT_DISPLAY_FONT_SIZE
    @transform = [1, 0, 0, 1, 0, 0]
    @transforms = []
  end

  def size
    V[`#@canvas.width`, `#@canvas.height`]
  end
  def size=(value)
    `#@canvas.width =  #{value.x}`
    `#@canvas.height = #{value.y}`
  end

  def width
    `#@canvas.width`
  end
  def width=(value)
    `#@canvas.width =  #{value.x}`
  end

  def height
    `#@canvas.height`
  end
  def height=(value)
    `#@canvas.height =  #{value.x}`
  end

  def fill_color
    C[`#@context.fillStyle`]
  end
  def fill_color=(color)
    `#@context.fillStyle = #{color.to_hex}`
  end

  def stroke_color
    C[`#@context.strokeStyle`]
  end
  def stroke_color=(color)
    `#@context.strokeStyle = #{color.to_hex}`
  end

  def stroke_width
    `#@context.lineWidth`
  end
  def stroke_width=(number)
    `#@context.lineWidth = #{number}`
  end

  def color_at(position)
    data = `#@context.getImageData(#{position.x}, #{position.y}, 1, 1).data`
    C[`data[0]`, `data[1]`, `data[2]`]
  end

  def transform
    @transform + [0, 0, 1] # appendage to fulfill signature
  end

  def translate(distance)
    @transform[4] += `#{@transform[0]} * #{distance.x} + #{@transform[2]} * #{distance.y}`
    @transform[5] += `#{@transform[1]} * #{distance.x} + #{@transform[3]} * #{distance.y}`

    %x{
      #@context.setTransform(#{@transform[0]}, #{@transform[1]},
                             #{@transform[2]}, #{@transform[3]},
                             #{@transform[4]}, #{@transform[5]}); }
  end

  def scale(multiplier)
    %x{
      #{@transform} = [#{@transform[0]} * #{multiplier.x},
                       #{@transform[1]} * #{multiplier.x},
                       #{@transform[2]} * #{multiplier.y},
                       #{@transform[3]} * #{multiplier.y},
                       #{@transform[4]}, #{@transform[5]}];

      #@context.setTransform(#{@transform[0]}, #{@transform[1]},
                             #{@transform[2]}, #{@transform[3]},
                             #{@transform[4]}, #{@transform[5]}); }
  end

  def rotate(radians)
    %x{
      var cos = Math.cos(#{radians}),
          sin = Math.sin(#{radians}),
          e0 = #{@transform[0]} * cos + #{@transform[2]} * sin,
          e1 = #{@transform[1]} * cos + #{@transform[3]} * sin,
          e2 = #{@transform[0]} * -sin + #{@transform[2]} * cos,
          e3 = #{@transform[1]} * -sin + #{@transform[3]} * cos;

      #@transform = [e0, e1, e2, e3, #{@transform[4]}, #{@transform[5]}];

      #@context.setTransform(#{@transform[0]}, #{@transform[1]},
                             #{@transform[2]}, #{@transform[3]},
                             #{@transform[4]}, #{@transform[5]}); }
  end

  def push
    @transforms.push(@transform.dup)
  end

  def pop
    @transform = @transforms.pop

    %x{
      #@context.setTransform(#{@transform[0]}, #{@transform[1]},
                             #{@transform[2]}, #{@transform[3]},
                             #{@transform[4]}, #{@transform[5]}); }
  end

  def line(pos1, pos2)
    %x{
      #@context.beginPath();
      #@context.moveTo(#{pos1.x}, #{pos1.y});
      #@context.lineTo(#{pos2.x}, #{pos2.y});
      #@context.closePath();
      #@context.stroke();
    }
  end

  def stroke_rectangle(position, size)
    `#@context.strokeRect(#{position.x}, #{position.y}, #{size.x}, #{size.y})`
  end

  def fill_rectangle(position, size)
    `#@context.fillRect(#{position.x}, #{position.y}, #{size.x}, #{size.y})`
  end

  def begin_shape
    `#@context.beginPath()`
  end

  def end_shape
    `#@context.closePath()`
  end

  def move_to(position)
    `#@context.moveTo(#{position.x}, #{position.y})`
  end

  def line_to(position)
    `#@context.lineTo(#{position.x}, #{position.y})`
  end

  def stroke_shape
    `#@context.stroke()`
  end

  def fill_shape
    `#@context.fill()`
  end

  def clear
    `#@context.fillRect(0, 0, #{size.x}, #{size.y})`
  end

  def image(image, position)
    `#@context.drawImage(#{image.to_n}, #{position.x}, #{position.y})`
  end

  def image_cropped(image, position, crop_position, crop_size)
    %x{#@context.drawImage(#{image.to_n},
                           #{crop_position.x}, #{crop_position.y},
                           #{crop_size.x}, #{crop_size.y},
                           #{position.x}, #{position.y},
                           #{crop_size.x}, #{crop_size.y})}
  end

  def font_type=(type)
    @font_type = type

    font = "#{@font_size}px #{@font_type}"
    `#@context.font = #{font}`
  end

  def font_size=(size)
    @font_size = size

    font = "#{@font_size}px #{@font_type}"
    `#@context.font = #{font}`
  end

  def fill_text(value, position)
    `#@context.fillText(#{value}, #{position.x}, #{position.y})`
  end

  def stroke_text(value, position)
    `#@context.strokeText(#{value}, #{position.x}, #{position.y})`
  end
end
end
end
