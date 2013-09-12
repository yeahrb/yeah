class Yeah::Color
  attr_accessor :rgba_bytes

  class << self
    alias_method :[], :new
  end

  def initialize(*arguments)
    arguments = [0, 0, 0, 255] if arguments.empty?

    case arguments[0]
    when Numeric
      @rgba_bytes = [*arguments]
    when Array
      @rgba_bytes = arguments[0]
    end
  end

  def ==(other)
    self.class == other.class && @rgba_bytes == other.rgba_bytes ? true : false
  end
end
