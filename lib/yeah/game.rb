# Manages entities.
class Yeah::Game
  include Yeah

  def initialize
    @resolution = V[320, 180]
    @surface = Surface.new(@resolution)
  end

  # @!attribute [r] backend
  #   @return [Platform] platform bindings
  attr_reader :backend

  # @!attribute surface
  #   @return [Surface] visual render
  attr_accessor :surface

  attr_accessor :map

  # @!attribute resolution
  #   @return [Vector] size of screen
  attr_accessor :resolution

  # Start the game loop.
  def start
    @backend = DesktopBackend.new

    backend.each_tick do
      update
      draw
      break if @stopped
    end
  end

  # Stop the game loop.
  def stop
    @backend = nil
    @stopped = true
  end

  def update
    # TODO: Clean
    return unless @map

    @map.entities.each { |e| e.update }
  end

  def draw
    surface.fill(Color[0, 0, 0, 0])

    # TODO: Clean
    return unless @map

    @map.entities.each do |entity|
      surface.draw(entity.surface, entity.position) unless entity.surface.nil?
    end

    backend.render(surface)
  end

  protected :update, :draw
end
