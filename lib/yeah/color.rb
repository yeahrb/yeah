# Color.
class Yeah::Color
  # @!attribute rgba_bytes
  #   @return [Array<(Integer, Integer, Integer, Integer)>] red, green, blue,
  #     alpha bytes
  attr_accessor :rgba_bytes

  class << self
    alias_method :[], :new
  end

  def initialize(*values)
    default_values = [0, 0, 0, 255]
    values += default_values[values.size..-1]
    @rgba_bytes = values
  end

  def inspect
    "#{self.class.name}[#{rgba_bytes.join(', ')}]"
  end

  def ==(other)
    self.class == other.class && @rgba_bytes == other.rgba_bytes
  end
end
