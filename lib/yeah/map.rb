# A map of entities for a Game.
class Yeah::Map
  include Yeah

  def initialize
    @background = @@background ||= Color[]
    @@key ||= {}
    @@tile_size ||= 0
    @@tiles ||= []
  end

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
