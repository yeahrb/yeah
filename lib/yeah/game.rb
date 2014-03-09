# Manages areas and context.
module Yeah

class Game
  def initialize(context = NullContext.new)
    @context = context
  end

  # @return [Context]
  attr_reader :context

  def area
    @area ||= Area.new
  end
  def area=(value)
    @area = value
    @area.game = self if area.game != self
  end

  # Start the game.
  def start
    context.each_tick do
      update
      render
      break if @stopped
    end
  end

  # Stop the game.
  def stop
    @context = nil
    @stopped = true
  end

  protected

  def update
    area.update
  end

  def render
    context.render(area)
  end
end

end
