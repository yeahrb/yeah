class Yeah::Game
  attr_accessor :entities, :screen, :platform, :resolution, :playing

  def initialize
    @resolution = Yeah::Vector[320, 240]
    @screen = Yeah::Surface.new(@resolution)
    @platform = Yeah::Desktop.new
    @entities = []
    @playing = true
  end

  def update
    @entities.each { |e| e.update }
  end

  def draw
    @entities.each do |entity|
      surface = entity.draw
      screen.draw(surface, entity.position) unless surface.nil?
    end
  end
end
