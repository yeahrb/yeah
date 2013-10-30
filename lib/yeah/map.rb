# A map of entities for a Game.
class Yeah::Map
  # @!attribute background
  #   @return [Color] background color
  # @!attribute key
  #   @return [Hash] tile key
  attr_accessor :background, :key, :tile_size, :tiles

  def self.background(background)
    @@background = background
  end

  def self.key(key)
    @@key = key
  end

  def self.tile_size(tile_size)
    @@tile_size = tile_size
  end

  def self.tiles(tiles)
    @@tiles = tiles
  end

  def initialize
    @background = @@background || Color[]
    @key = @@key ||= {}
    @tile_size = @@tile_size ||= V[]
    @tiles = @@tiles ||= []
  end
end
