class Yeah::Game
  attr_accessor :entities

  def initialize
    @platform = Yeah::Desktop.new
    @entities = []
  end

  def update
    @entities.each { |e| e.update }
  end
end
