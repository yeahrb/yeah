# Manages stages and context.
class Yeah::Game
  include Yeah

  # @return [Context]
  attr_reader :context

  def stage
    @stage ||= NullStage.new
  end
  def stage=(value)
    @stage = value
    @stage.game = self if stage.game != self
  end

  # Size of screen.
  #
  # @return [Vector]
  def resolution
    @resolution ||= V[320, 180]
  end
  attr_writer :resolution

  # Start the game.
  def start
    @context = PreferredContext.new

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
    stage.update
  end

  def render
    context.render(stage)
  end
end
