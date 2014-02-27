# Manages areas and context.
class Yeah::Game
  include Yeah

  def initialize(context_type = NullContext)
    @context_type = context_type
  end

  attr_reader :context_type

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
    @context = context_type.new

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
