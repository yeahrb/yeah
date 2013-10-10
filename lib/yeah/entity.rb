# Game object.
class Yeah::Entity
  attr_accessor :position, :visual

  class << self
    def define_position_helpers
      %w(x y z).each_with_index do |coord, i|
        define_method(coord) { @position[i] }
        define_method("#{coord}=") { |val| @position[i] = val }
      end
    end
  end

  define_position_helpers

  def initialize(position=Vector[])
    @position = position
  end

  def draw
    visual.draw if visual
  end
end
