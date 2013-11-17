# Three-dimensional geometric vector. Used as position or size.
class Yeah::Vector
  # @!attribute components
  #   @return [Array<(Numeric, Numeric, Numeric)>]
  # @!attribute [r] to_a
  #   @see components
  # @!attribute []
  #   @param [Integer] *n* of component
  #   @return [Numeric] *n*th component
  attr_reader :components
  alias_method :to_a, :components

  def self.random(*component_maxes)
    components = component_maxes.map { |cm| Random.rand(cm) }
    self.new(*components)
  end

  def initialize(*components)
    components = components.first.to_a if components.first.respond_to?(:to_a)

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

  def operate(operand, operator)
    case operand
    when self.class
      comp_operand = operand.components
    when Numeric
      comp_operand = [operand] * 3
    end

    components = @components.zip(comp_operand).map { |c| c.reduce(operator) }
    self.class[*components]
  end

  def +(addend)
    operate(addend, :+)
  end

  def -(subtrahend)
    operate(subtrahend, :-)
  end

  def *(multiple)
    operate(multiple, :*)
  end

  def /(divisor)
    operate(divisor, :/)
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
  end

  private :operate
end

# Shorthand for Vector.
Yeah::V = Yeah::Vector
