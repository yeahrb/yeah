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
  end

  def size
    V[`#@canvas.width`, `#@canvas.height`]
  end
  def size=(value)
    `#@canvas.width =  #{value.x}`
    `#@canvas.height = #{value.y}`
  end

  def fill
    C[`#@context.fillStyle`]
  end
  def fill=(color)
    `#@context.fillStyle = #{color.to_hex}`
  end

  def stroke
    C[`#@context.strokeStyle`]
  end
  def stroke=(color)
    `#@context.strokeStyle = #{color.to_hex}`
  end

  def line_width
    `#@context.lineWidth`
  end
  def line_width=(number)
    `#@context.lineWidth = #{number}`
  end

  def color_at(position)
    data = `#@context.getImageData(#{position.x}, #{position.y}, 1, 1).data`
    C[`data[0]`, `data[1]`, `data[2]`]
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

  def rectangle(position, size)
    `#@context.fillRect(#{position.x}, #{position.y}, #{size.x}, #{size.y})`
    `#@context.strokeRect(#{position.x}, #{position.y}, #{size.x}, #{size.y})`
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

  def stroke
    `#@context.stroke()`
  end

  def fill
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
    update_font
  end

  def font_size=(size)
    @font_size = size
    update_font
  end

  def text(position, value)
    `#@context.fillText(#{value}, #{position.x}, #{position.y})`
    `#@context.strokeText(#{value}, #{position.x}, #{position.y})`
  end

  private

  def update_font
    font = "#{font_size}px #{font_type}"
    `#@context.font = #{font}`
  end
end
end
end
