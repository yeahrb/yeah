# A map of entities for a Game.
class Yeah::Map
  # @!attribute background
  #   @return [Color] background color
  attr_accessor :background
  attr_writer :key

  def self.key(key)
    @@key = key
  end

  def initialize
    @background = Color[]
    @key = @@key || {}
  end

  def key
    @key
  end
end
