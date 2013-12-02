# Manages entities.
class Yeah::Game
  include Yeah

  def initialize
    @resolution = V[320, 180]
    @screen = Surface.new(@resolution)
    @platform = Desktop.new
    @entities = []
  end

  # @!attribute [r] platform
  #   @return [Platform] underlying platform bindings
  attr_reader :platform

  # @!attribute screen
  #   @return [Surface] visual render
  attr_accessor :screen

  # @!attribute resolution
  #   @return [Vector] size of screen
  attr_accessor :resolution

  # @!attribute entities
  #   @return [Array] active entities
  attr_reader :entities

  def entities=(value)
    @entities = value
    @entities.each { |e| e.game = self }
  end

  # Start the game loop.
  def start
    platform.each_tick do
      update
      draw
      break if @stopped
    end
  end

  # Stop the game loop.
  def stop
    @stopped = true
  end

  def update
    @entities.each { |e| e.update }
  end

  def draw
    screen.fill(Color[0, 0, 0, 0])
    @entities.each do |entity|
      screen.draw(entity.surface, entity.position) unless entity.surface.nil?
    end
    platform.render(screen)
  end

  protected :update, :draw
end
