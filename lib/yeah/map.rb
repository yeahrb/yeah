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
    # TODO
    []
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

  protected :entities_from_tiles
end
