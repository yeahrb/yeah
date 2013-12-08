# Three-dimensional geometric vector. Used as position or size.
class Yeah::Vector
  def inspect
    "#{self.class.name}#{components.inspect}"
  end

  def initialize(*components)
    components = components.first.to_a if components.first.respond_to?(:to_a)

    if components.size > 3
      error_message = "too many arguments (#{components.size} for up to 3)"
      raise ArgumentError, error_message
    end

    self.components = components
  end

  def self.random(*component_maxes)
    components = component_maxes.map { |cm| Random.rand(cm) }
    self.new(*components)
  end

  # @return [Array<(Numeric x3)>]
  attr_reader :components
  def components=(values)
    if values.size > 3
      error_message = "too many elements (#{values.size} for up to 3)"
      raise ArgumentError, error_message
    end

    @components = values + [0] * (3 - values.size)
  end
  alias_method :to_a, :components

  def ==(other)
    other.class == self.class && @components == other.components ? true : false
  end

  # Gets component at index.
  # @param [Integer] index
  # @return [Numeric] component
  def [](index)
    @components[index]
  end

  def []=(index, value)
    @components[index] = value
  end

  def operate(operand, operator)
    if operand.respond_to? :to_a
      operand = operand.to_a
    else
      operand = Array.new(3, operand)
    end

    components = @components.zip(operand).map { |cs| cs.reduce(operator) }
    self.class[components]
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
  alias_method :length, :magnitude
  alias_method :distance, :magnitude
  alias_method :speed, :magnitude

  # Reset every component to 0.
  def reset
    @components = [0, 0, 0]
  end

  class << self
    alias_method :[], :new

    def define_component_shorthands
      name_sets = [[:x, :width],
                   [:y, :height],
                   [:z, :depth]]

      name_sets.each_with_index do |set, n|
        set.each do |name|
          define_method(name) { @components[n] }
          define_method("#{name}=") { |val| @components[n] = val }
        end
      end
    end
  end

  define_component_shorthands

  private :operate
end

# Shorthand for Vector.
Yeah::V = Yeah::Vector
