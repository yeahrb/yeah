# A map of entities for a Game.
class Yeah::Map
  # @!attribute background
  #   @return [Color] background color
  # @!attribute key
  #   @return [Hash] tile key
  attr_accessor :background, :key

  def self.background(background)
    @@background = background
  end

  def self.key(key)
    @@key = key
  end

  def initialize
    @@key ||= {}

    @background = @@background || Color[]
    @key = @@key
  end
end
