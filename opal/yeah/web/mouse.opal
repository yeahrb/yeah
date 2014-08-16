module Yeah
module Web
class Mouse
  BUTTON_MAP = {
    0 => :left,
    1 => :middle,
    2 => :right
  }

  attr_reader :position

  def initialize(args = {})
    canvas_selector = args.fetch(:canvas_selector, DEFAULT_CANVAS_SELECTOR)

    @canvas = `document.querySelectorAll(#{canvas_selector})[0]`
    @buttons = {}

    %x{
      #@canvas.addEventListener('mousemove', function(event) {
        if (event.offsetX) {
          #{@position = V[`event.offsetX`, `event.offsetY`]}
        } else {
          #{@position = V[`event.layerX`, `event.layerY`]}
        }
      });

      #@canvas.addEventListener('mousedown', function(event) {
        #{@buttons[BUTTON_MAP[`event.button`]] = true}
      });

      #@canvas.addEventListener('mouseup', function(event) {
        #{@buttons[BUTTON_MAP[`event.button`]] = false}
      });
    }
  end

  def pressing?(button)
    @buttons[button] || false
  end
end
end
end
