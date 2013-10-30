# Game object.
class Yeah::Entity
  # @!attribute position
  #   @return [Vector] position within a game
  # @!attribute visual
  #   @return [Visual] visual representation within a game
  attr_accessor :position, :visual

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

  # @!attribute x
  #   @return [Vector] position.x
  # @!attribute y
  #   @return [Vector] position.y
  # @!attribute z
  #   @return [Vector] position.z
  define_position_helpers

  # Get visual representation from visual.
  #   @return [Surface] visual representation
  def draw
    visual.draw if visual
  end
end
