class Yeah::Color
  class << self
    alias_method :[], :new
  end

  def initialize(*values)
    default_values = [0, 0, 0, 255]
    values += default_values[values.size..-1]
    self.bytes = values
  end

  def to_s
    "#{self.class.name}#{bytes.to_s}"
  end

  def red
    @red ||= 0
  end
  attr_writer :red

  def blue
    @blue ||= 0
  end
  attr_writer :blue

  def green
    @green ||= 0
  end
  attr_writer :green

  def ==(other)
    other.respond_to?(:bytes) && self.bytes == other.bytes
  end

  # Color bytes in RGBA format.
  # @return [Array<(Integer x4)>]
  attr_accessor :bytes
end
