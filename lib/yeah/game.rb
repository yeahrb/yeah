# Manages maps and context.
class Yeah::Game
  include Yeah

  def initialize
    @resolution = V[320, 180]
  end

  # @return [Context]
  attr_reader :context

  attr_reader :map
  def map=(value)
    @map = value
    @map.game = self unless @map.game == self
  end

  # Size of screen.
  # @return [Vector]
  attr_accessor :resolution

  # Spawn a context and start a game loop.
  def start
    @context = DesktopWindow.new

    context.each_tick do
      update
      render
      break if @stopped
    end
  end

  # Kill the context and stop the game loop.
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
