module Yeah
module Web
class Mouse
  BUTTON_MAP = {
    0 => :left,
    1 => :middle,
    2 => :right,
    3 => 4,
    4 => 5
  }

  attr_reader :position

  def initialize(args = {})
    canvas_selector = args.fetch(:canvas_selector, DEFAULT_CANVAS_SELECTOR)
    @ticker = args.fetch(:ticker)
    @canvas = `document.querySelectorAll(#{canvas_selector})[0]`
    @pressed_buttons = {}
    @released_buttons = {}

    %x{
      #@canvas.addEventListener('mousemove', function(event) {
        if (event.offsetX) {
          #{@position = V[`event.offsetX`, `event.offsetY`]}
        } else {
          #{@position = V[`event.layerX`, `event.layerY`]}
        }
      });

      #@canvas.addEventListener('mousedown', function(event) {
        #{button = BUTTON_MAP[`event.button`]}
        if (#{!@pressed_buttons[button]}) {
          #{@pressed_buttons[button] = @ticker.tick_count}
        }
      });

      #@canvas.addEventListener('mouseup', function(event) {
        #{button = BUTTON_MAP[`event.button`]}
        #{@released_buttons[button] = @ticker.tick_count}
        #{@pressed_buttons[button] = nil}
      });
    }
  end

  def pressing?(button)
    !!@pressed_buttons[button] || false
  end

  def pressed?(button)
    @pressed_buttons[button] == @ticker.tick_count
  end

  def released?(button)
    @released_buttons[button] == @ticker.tick_count
  end
end
end
end
