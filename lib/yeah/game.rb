class Yeah::Game
  attr_accessor :resolution, :entities

  def initialize
    @resolution = Yeah::Vector[320, 240]
    @platform = Yeah::Desktop.new
    @entities = []
  end

  def update
    @entities.each { |e| e.update }
  end

  def draw
    @entities.each { |e| e.draw(@platform) }
  end
end
