class Yeah::Vector
  class << self
    alias_method :[], :new
  end

  def initialize(*components)
    if components.size > 3
      error_message = "too many arguments (#{components.size} for up to 3)"
      raise ArgumentError, error_message
    end

    self.components = components
  end

  def components
    @components
  end

  def components=(values)
    if values.size > 3
      error_message = "too many elements (#{values.size} for up to 3)"
      raise ArgumentError, error_message
    end

    @components = values + [0] * (3 - values.size)
  end

  def [](index)
    @components[index]
  end

  def []=(index, value)
    @components[index] = value
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

  def norm
    Math.sqrt(@components.inject(0) { |v, e| v + e.abs2 })
  end
  alias_method :magnitude, :norm
  alias_method :length, :norm
  alias_method :distance, :norm
  alias_method :speed, :norm
end
