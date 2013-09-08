class Yeah::Color
  attr_accessor :byte_array

  class << self
    alias_method :[], :new
  end

  def initialize(*arguments)
    arguments = [0, 0, 0, 255] if arguments.empty?

    case arguments[0]
    when Numeric
      @byte_array = [*arguments]
    when Array
      @byte_array = arguments[0]
    end
  end

  def ==(other)
    self.class == other.class && @byte_array == other.byte_array ? true : false
  end
end
