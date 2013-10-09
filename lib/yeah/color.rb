class Yeah::Color
  attr_accessor :rgba_bytes

  class << self
    alias_method :[], :new
  end

  def initialize(*arguments)
    arguments = [0, 0, 0, 255] if arguments.empty?
    @rgba_bytes = [*arguments]
  end

  def inspect
    "#{self.class.name}[#{rgba_bytes.join(', ')}]"
  end

  def ==(other)
    self.class == other.class && @rgba_bytes == other.rgba_bytes
  end
end
