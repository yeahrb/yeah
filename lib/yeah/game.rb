# Manages stages and context.
class Yeah::Game
  include Yeah

  def initialize
    self.resolution = V[320, 180]
  end

  # @return [Context]
  attr_reader :context

  attr_reader :stage
  def stage=(value)
    @stage = value
    @stage.game = self if stage.game != self
  end

  # Size of screen.
  #
  # @return [Vector]
  attr_accessor :resolution

  # Start the game.
  def start
    @context = DesktopWindow.new

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

  def update
    stage.update if stage
  end

  def render
    context.render(stage) if stage
  end

  protected :update, :render
end
