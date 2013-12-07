# A map of entities for a Game.
class Yeah::Map
  include Yeah

  def initialize
    @background = self.class.background
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

  def entities_from_tiles
    self.class.tiles.reverse.map.with_index do |tile_row, tile_y|
      actual_y = tile_y * self.class.tile_size

      tile_row.chars.map.with_index do |tile, tile_x|
        next if tile == " "

        actual_x = tile_x * self.class.tile_size
        tile_entity = self.class.key.fetch(tile)

        tile_entity.new(V[actual_x, actual_y])
      end
    end.flatten.compact
  end

  def self.key(value=nil)
    @@key ||= {}
    return @@key unless value
    @@key = value
  end

  def self.tile_size(value=nil)
    @@tile_size ||= 0
    return @@tile_size unless value
    @@tile_size = value
  end

  def self.tiles(value=nil)
    @@tiles ||= []
    return @@tiles unless value
    @@tiles = value
  end

  def self.background(value=nil)
    @@background ||= Color[]
    return @@background unless value
    @@background = value
  end
end
