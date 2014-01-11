class Yeah::Stage
  include Yeah

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

  def initialize
    @background = self.class.background
    @entities = entities_from_tiles
  end

  # Background color.
  #
  # @return [Color]
  attr_accessor :background

  # Active entities.
  #
  # @return [Array]
  def entities
    @entities ||= []
  end
  def entities=(value)
    @entities = value
    @entities.each { |e| e.stage = self }
  end

  attr_reader :game
  def game=(value)
    @game = value
    @game.stage = self unless @game.stage == self
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

  def update
    entities.each(&:update)
  end
end
