module Yeah

class Level
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
  def background=(value)
    @background = Color[value]
  end

  # Active things.
  #
  # @return [Array]
  def things
    @things ||= []
  end
  def things=(value)
    @things = value
    @things.each { |e| e.level = self }
  end

  attr_reader :game
  def game=(value)
    @game = value
    @game.level = self unless @game.level == self
  end

  def update
    things.each(&:update)
  end
end

end
