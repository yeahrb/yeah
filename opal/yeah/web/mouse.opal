module Yeah
module Web
class Mouse
  attr_reader :position, :is_pressing
  alias :pressing? :is_pressing
  private :is_pressing

  def initialize(args = {})
    canvas_selector = args.fetch(:canvas_selector, DEFAULT_CANVAS_SELECTOR)

    @canvas = `document.querySelectorAll(#{canvas_selector})[0]`

    %x{
      #@canvas.addEventListener('mousemove', function(event) {
        if (event.offsetX) {
          #{@position = V[`event.offsetX`, `event.offsetY`]}
        } else {
          #{@position = V[`event.layerX`, `event.layerY`]}
        }
      });

      #@canvas.addEventListener('mousedown', function(event) {
        #{@is_pressing = true}
      });

      #@canvas.addEventListener('mouseup', function(event) {
        #{@is_pressing = false}
      });
    }
  end
end
end
end
