# Game object.
class Yeah::Entity
  # @!attribute position
  #   @return [Vector] position within a game
  # @!attribute size
  #   @return [NilClass|Vector] visual size
  # @!attribute state
  #   @return [Symbol] state in game
  # @!attribute visual
  #   @return [Visual] visual representation within a game
  # @!attribute game
  #   @return [Game] game to which this belongs to
  attr_accessor :position, :state, :visual
  attr_reader :game
  attr_writer :size

  def initialize(position=V[])
    @position = position
  end

  class << self
    def define_position_helpers
      %w(x y z).each_with_index do |coord, i|
        define_method(coord) { @position[i] }
        define_method("#{coord}=") { |val| @position[i] = val }
      end
    end
  end

  def size
    @size || visual && visual.size
  end

  def game=(value)
    @game = value
    @game.entities << self unless @game.entities.include? self
  end

  # @!attribute x
  #   @return [Vector] position.x
  # @!attribute y
  #   @return [Vector] position.y
  # @!attribute z
  #   @return [Vector] position.z
  define_position_helpers

  # Update entity.
  def update
  end

  # Get visual representation from visual.
  #   @return [Surface] visual representation
  def draw
    visual.draw if visual
  end

  def pressing?(pressable)
    game.pressing? pressable
  end
end
