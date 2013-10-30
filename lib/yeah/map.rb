# A map of entities for a Game.
class Yeah::Map
  # @!attribute background
  #   @return [Color] background color
  # @!attribute key
  #   @return [Hash] tile key
  # @!attribute tile_size
  #   @return [Vector] size of each character in #tiles
  # @!attribute tiles
  #   @return [Array<String>] entities at relative positions
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
    @tile_size = @@tile_size ||= nil
    @tiles = @@tiles ||= []
  end

  def key=(key)
    @key = key
    self.tile_size = @key.first.last.new.size if @key.first && tile_size.nil?
  end
end
