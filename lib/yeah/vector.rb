class Yeah::Vector
  class << self
    alias_method :[], :new
  end

  def initialize(*components)
    if components.size > 3
      error_message = "too many arguments (#{components.size} for up to 3)"
      raise ArgumentError, error_message
    end

    @components = components + [0] * (3 - components.size)
  end

  def components
    @components
  end

  def [](index)
    @components[index]
  end

  def x
    @components[0]
  end
  alias_method :width, :x

  def y
    @components[1]
  end
  alias_method :height, :y

  def z
    @components[2]
  end
  alias_method :depth, :z
end
