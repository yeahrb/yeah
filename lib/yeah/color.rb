class Yeah::Color
  attr_accessor :byte_array

  class << self
    alias_method :[], :new
  end

  def initialize(value=[0, 0, 0, 255])
    @byte_array = value
  end
end
