# A map of entities for a Game.
class Yeah::Map
  # @!attribute background
  #   @return [Color] background color
  attr_accessor :background

  def initialize
    @background = Color[]
  end
end
