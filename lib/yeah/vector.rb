# Three-dimensional geometric vector. Used as position, velocity, size...
module Yeah
class Vector
  class << self
    alias_method :[], :new
  end

  def initialize(*comps)
    self.components = comps
  end

  def to_s
    "#{self.class.name}#{components}"
  end

  def to_a
    components
  end

  # @return [Array<(Numeric x3)>]
  attr_reader :components
  def components=(value)
    value = value.first if value.respond_to?(:size) && value.size == 1
    value = value.to_a if value.respond_to?(:to_a)
    value = [value].flatten

    if value.size > 3
      error_message = "too many elements (#{value.size} for up to 3)"
      raise ArgumentError, error_message
    end

    @components = value + [0] * (3 - value.size)
  end

  def ==(other)
    other.respond_to?(:components) && components == other.components
  end

  def +(v); operate(:+, v); end

  def -(v); operate(:-, v); end

  def *(v); operate(:*, v); end

  def /(v); operate(:/, v); end

  # Component (dimension) at index.
  #
  # @param [Integer] index
  # @return [Numeric]
  def [](index)
    components[index]
  end
  def []=(index, value)
    self.components[index] = value
  end

  private

  def operate(operator, operand)
    if operand.respond_to? :to_a
      operand = operand.to_a
    else
      operand = Array.new(3, operand)
    end

    comps = components.zip(operand).map { |cs| cs.reduce(operator) }
    self.class.new(comps)
  end
end
end
