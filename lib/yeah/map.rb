# A map of entities for a Game.
class Yeah::Map
  include Yeah

  def initialize
    @background = @@background ||= Color[]
    @key = @@key ||= {}
    @tile_size = @@tile_size ||= nil
    @tiles = @@tiles ||= []
  end

  # @!attribute key
  #   @return [Hash] tile key
  attr_reader :key
  def key=(key)
    @key = key
    self.tile_size = @key.first.last.new.size if @key.first && tile_size.nil?
  end

  # @!attribute tile_size
  #   @return [Vector] size of each character in #tiles
  attr_accessor :tile_size

  # @!attribute tiles
  #   @return [Array<String>] entities at relative positions
  attr_accessor :tiles

  # @!attribute background
  #   @return [Color] background color
  attr_accessor :background

  # @!attribute entities
  #   @return [Array] active entities
  def entities
    @entities ||= []
  end
  def entities=(value)
    @entities = value
    @entities.each { |e| e.map = self }
  end

  attr_reader :game
  def game=(value)
    @game = value
    @game.map = self unless @game.map == self
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

  def self.background(background)
    @@background = background
  end
end
