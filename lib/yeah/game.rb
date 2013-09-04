class Yeah::Game
  attr_accessor :entities

  def initialize
    @entities = []
  end

  def update
    @entities.each { |e| e.update }
  end
end
