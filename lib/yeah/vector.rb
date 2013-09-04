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

  def ==(other)
    other.class == self.class && @components == other.components ? true : false
  end

  def [](index)
    @components[index]
  end

  def []=(index, value)
    @components[index] = value
  end

  def +(addend)
    case addend
    when self.class
      comp_addends = addend.components
    when Numeric
      comp_addends = [addend] * 3
    end
    components = @components.zip(comp_addends).map { |c| c.reduce(:+) }

    self.class[*components]
  end

  def -(subtrahend)
    case subtrahend
    when self.class
      comp_subtrahends = subtrahend.components
    when Numeric
      comp_subtrahends = [subtrahend] * 3
    end
    components = @components.zip(comp_subtrahends).map { |c| c.reduce(:-)}

    self.class[*components]
  end

  def *(multiple)
    case multiple
    when self.class
      comp_multiples = multiple.components
    when Numeric
      comp_multiples = [multiple] * 3
    end

    components = @components.zip(comp_multiples).map { |c| c.reduce(:*) }
    self.class[*components]
  end

  def /(divisor)
    case divisor
    when self.class
      comp_divisors = divisor.components
    when Numeric
      comp_divisors = [divisor] * 3
    end

    components = @components.zip(comp_divisors).map { |c| c.reduce(:/) }
    self.class[*components]
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

  def x=(value)
    @components[0] = value
  end
  alias_method :width=, :x=

  def y=(value)
    @components[1] = value
  end
  alias_method :height=, :y=

  def z=(value)
    @components[2] = value
  end
  alias_method :depth=, :z=

  def norm
    Math.sqrt(@components.reduce(0) { |m, c| m + c*c })
  end
  alias_method :magnitude, :norm
  alias_method :length, :norm
  alias_method :distance, :norm
  alias_method :speed, :norm

  def reset!
    @components = [0, 0, 0]
    self
  end
end
