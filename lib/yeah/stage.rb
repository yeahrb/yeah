class Yeah::Stage
  include Yeah

  def initialize(properties={})
    properties.each do |key, val|
      writer = "#{key}="
      send(writer, val)
    end
  end

  # Background color.
  #
  # @return [Color]
  def background
    @background ||= Color[]
  end
  attr_writer :background

  # Active entities.
  #
  # @return [Array]
  def entities
    @entities ||= []
  end
  def entities=(value)
    @entities = value
    @entities.each { |e| e.stage = self }
  end

  attr_reader :game
  def game=(value)
    @game = value
    @game.stage = self unless @game.stage == self
  end

  def update
    entities.each(&:update)
  end
end
