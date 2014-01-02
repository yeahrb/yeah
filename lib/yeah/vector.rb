# Three-dimensional geometric vector. Used as position, velocity, size...
class Yeah::Vector
  class << self
    alias_method :[], :new
  end

  # @return [Vector]
  def self.random(*comp_maxes)
    comps = comp_maxes.map { |cm| Random.rand(cm) }
    self.new(*comps)
  end

  def initialize(*comps)
    self.components = comps
  end

  def inspect
    "#{self.class.name}#{components.inspect}"
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
  alias_method :to_a, :components

  def ==(other)
    self.class == other.class && self.components == other.components
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

  def x; components[0]; end
  def x=(v); self.components[0] = v; end

  def width; components[0]; end
  def width=(v); self.components[0] = v; end

  def y; components[1]; end
  def y=(v); self.components[1] = v; end

  def height; components[1]; end
  def height=(v); self.components[1] = v; end

  def z; components[2]; end
  def z=(v); self.components[2] = v; end

  def depth; components[2]; end
  def depth=(v); self.components[2] = v; end

  # @return [Numeric]
  def magnitude
    Math.sqrt(@components.reduce(0) { |m, c| m + c*c })
  end
  alias_method :length, :magnitude
  alias_method :distance, :magnitude
  alias_method :speed, :magnitude

  # Reset every component to 0.
  def reset
    self.components = [0, 0, 0]
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
