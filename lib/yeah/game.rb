# Manages entities.
class Yeah::Game
  include Yeah

  def initialize
    @resolution = V[320, 180]
  end

  # @!attribute [r] context
  #   @return [context]
  attr_reader :context

  attr_reader :map
  def map=(value)
    @map = value
    @map.game = self unless @map.game == self
  end

  # @!attribute resolution
  #   @return [Vector] size of screen
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
    @map.update if @map
  end

  def render
    context.render(@map.render) if @map
  end

  protected :update, :render
end
