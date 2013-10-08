class Yeah::Game
  attr_accessor :entities, :screen, :platform, :resolution

  def initialize
    @resolution = Vector[320, 180]
    @screen = Surface.new(@resolution)
    @platform = Desktop.new
    @entities = []
  end

  def update
    @entities.each { |e| e.update }
  end

  def draw
    screen.fill(Color[0, 0, 0, 0])
    @entities.each do |entity|
      surface = entity.draw
      screen.draw(surface, entity.position) unless surface.nil?
    end
    platform.render(screen)
  end

  def start
    platform.each_tick do
      update
      draw
      break if @stopped
    end
  end

  def stop
    @stopped = true
  end
end
