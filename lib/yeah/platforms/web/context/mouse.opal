module Yeah
module Web

class Mouse
  def initialize(screen)
    setup_position_listener(screen)
  end

  def position
    @position ||= V[]
  end

  private

  # TODO: cleanup
  def setup_position_listener(screen)
    screen.canvas.addEventListener('mousemove') do |event|
      canvas_bounds = screen.canvas.getBoundingClientRect
      canvas_size = V[canvas_bounds.width, canvas_bounds.height]
      canvas_offset = V[canvas_bounds.left, canvas_bounds.top]
      real_mouse_pos = V[`event.clientX`, `event.clientY`]
      canvas_mouse_pos = real_mouse_pos - canvas_offset
      canvas_mouse_pos.y = canvas_size.y - canvas_mouse_pos.y

      @position = canvas_mouse_pos * screen.resolution / canvas_size
    end
  end
end

end
end
