# Manages levels and context.
module Yeah

class Game
  def initialize(context = NullContext.new)
    @context = context
  end

  # @return [Context]
  attr_reader :context

  def level
    @level ||= Level.new
  end
  def level=(value)
    @level = value
    @level.game = self if level.game != self
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
    level.update
  end

  def render
    context.render(level)
  end
end

end
