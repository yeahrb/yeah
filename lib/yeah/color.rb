class Yeah::Color
  class << self
    alias_method :[], :new
  end

  def initialize(*values)
    default_values = [0, 0, 0, 255]
    values += default_values[values.size..-1]
    self.rgba_bytes = values
  end

  def to_s
    "#{self.class.name}#{rgba_bytes.to_s}"
  end

  def ==(other)
    self.class == other.class && self.rgba_bytes == other.rgba_bytes
  end

  # Color bytes in RGBA format.
  # @return [Array<(Integer x4)>]
  attr_accessor :rgba_bytes
end
