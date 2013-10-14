# Three-dimensional geometric vector. Used as position or size.
class Yeah::Vector
  # @!attribute components
  #   @return [Array<(Numeric, Numeric, Numeric)>]
  # @!attribute []
  #   @param [Integer] *n* of component
  #   @return [Numeric] *n*th component
  attr_reader :components

  def initialize(*components)
    if components.size > 3
      error_message = "too many arguments (#{components.size} for up to 3)"
      raise ArgumentError, error_message
    end

    self.components = components
  end

  def inspect
    "#{self.class.name}[#{components.join(', ')}]"
  end

  def components=(values)
    if values.size > 3
      error_message = "too many elements (#{values.size} for up to 3)"
      raise ArgumentError, error_message
    end

    @components = values + [0] * (3 - values.size)
  end

  class << self
    alias_method :[], :new

    def define_component_helpers
      component_name_sets = [[:x, :width], [:y, :height], [:z, :depth]]
      component_name_sets.each_with_index do |set, ci|
        set.each do |name|
          define_method(name) { @components[ci] }
          define_method("#{name}=") { |val| @components[ci] = val }
        end
      end
    end
  end

  define_component_helpers

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

  # @return [Numeric]
  def magnitude
    Math.sqrt(@components.reduce(0) { |m, c| m + c*c })
  end
  # @!attribute length
  #   @see magnitude
  # @!attribute distance
  #   @see magnitude
  # @!attribute speed
  #   @see magnitude
  alias_method :length, :magnitude
  alias_method :distance, :magnitude
  alias_method :speed, :magnitude

  # Reset every component to 0.
  def reset
    @components = [0, 0, 0]
    self
  end
end
