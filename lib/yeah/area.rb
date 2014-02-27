module Yeah
class Area
  def initialize(properties = {})
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
    @entities.each { |e| e.area = self }
  end

  attr_reader :game
  def game=(value)
    @game = value
    @game.area = self unless @game.area == self
  end

  def update
    entities.each(&:update)
  end
end
end
