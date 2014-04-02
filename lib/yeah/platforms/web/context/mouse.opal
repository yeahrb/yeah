module Yeah
module Web

class Mouse
  def initialize(screen)
    @screen = screen

    setup_position_listener
    setup_click_listeners
  end

  def position
    @position ||= V[]
  end

  def left_clicked?
    @left_clicked || false
  end

  def middle_clicked?
    @middle_clicked || false
  end

  def right_clicked?
    @right_clicked || false
  end

  private

  # TODO: cleanup
  def setup_position_listener
    @screen.canvas.addEventListener('mousemove') do |event|
      canvas_bounds = @screen.canvas.getBoundingClientRect
      canvas_size = V[canvas_bounds.width, canvas_bounds.height]
      canvas_offset = V[canvas_bounds.left, canvas_bounds.top]
      real_mouse_pos = V[`event.clientX`, `event.clientY`]
      canvas_mouse_pos = real_mouse_pos - canvas_offset
      canvas_mouse_pos.y = canvas_size.y - canvas_mouse_pos.y

      @position = canvas_mouse_pos * @screen.resolution / canvas_size
    end
  end

  # TODO: cleanup
  def setup_click_listeners
    @screen.canvas.addEventListener('mousedown') do |event|
      case `event.button`
      when 0:
        @left_clicked = true
      when 1:
        @middle_clicked = true
      when 2:
        @right_clicked = true
      end
    end

    @screen.canvas.addEventListener('mouseup') do |event|
      case `event.button`
      when 0:
        @left_clicked = false
      when 1:
        @middle_clicked = false
      when 2:
        @right_clicked = false
      end
    end
  end
end

end
end
