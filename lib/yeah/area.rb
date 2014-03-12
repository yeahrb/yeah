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

  # Active things.
  #
  # @return [Array]
  def things
    @things ||= []
  end
  def things=(value)
    @things = value
    @things.each { |e| e.area = self }
  end

  attr_reader :game
  def game=(value)
    @game = value
    @game.area = self unless @game.area == self
  end

  def update
    things.each(&:update)
  end
end
end
