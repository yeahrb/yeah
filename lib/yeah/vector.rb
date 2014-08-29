require 'forwardable'

module Yeah

# The `Vector` represents a mathematical vector. It can be used to describe
# a position, velocity or direction.
#
# `V` is an alias for `Vector`.
#
# @example Basic vector math
#   V[5, 5] + V[10, 20]
#   # => Yeah::Vector[15, 25, 0]
#
#   V[3, 6, 9] / 3
#   # => Yeah::Vector[1, 2, 3]
class Vector
  extend Forwardable

  class << self
    # @param arguments catch-all
    # @return [Vector]
    # Alias for ::new.
    def [](*args)
      new(*args)
    end
  end

  # @return [Array] vector components
  attr_accessor :components

  # @!attribute []
  # @return [Numeric] *n*th component value
  def_delegators :@components, :[]

  # @param [Numeric] first component, defaults to 0
  # @param [Numeric] second component, defaults to 0
  # @param [Numeric] third component, defaults to 0
  def initialize(*components)
    @components = components + [0] * (3 - components.size)
  end

  # @return [String] readable representation
  def inspect
    "#{self.class.name}#{@components.to_s}"
  end

  # @!attribute x
  # @param [Numeric] first component value
  # @return [Numeric] first component value

  # @!attribute y
  # @param [Numeric] second component value
  # @return [Numeric] second component value

  # @!attribute z
  # @param [Numeric] third component value
  # @return [Numeric] third component value
  %i[x y z].each_with_index do |component, i|
    define_method(component) { @components[i] }
    define_method("#{component}=") { |v| @components[i] = v }
  end

  # @return [Numeric] vector's length
  def length
    Math.sqrt(@components[0] ** 2 + @components[1] ** 2 + @components[2] ** 2)
  end

  alias :magnitude :length

  # @return [Vector] vector of same direction whose length is 1
  def normalize
    self / length
  end

  alias :unit :normalize

  # @param [Vector] vector to compare
  # @return [Boolean] whether self matches vector
  def ==(other)
    @components == other.components
  end

  # @param [Vector] vector to add
  # @return [Vector] vector sum
  def +(vector)
    self.class.new(@components[0] + vector.components[0],
                   @components[1] + vector.components[1],
                   @components[2] + vector.components[2])
  end

  # @param [Vector] vector to subtract
  # @return [Vector] vector difference
  def -(vector)
    self.class.new(@components[0] - vector.components[0],
                   @components[1] - vector.components[1],
                   @components[2] - vector.components[2])
  end

  # @param [Numeric] numeric to multiply vector by
  # @return [Vector] vector product
  def *(numeric)
    self.class.new(@components[0] * numeric,
                   @components[1] * numeric,
                   @components[2] * numeric)
  end

  # @param [Numeric] numeric to divide vector by
  # @return [Vector] vector quotient
  def /(numeric)
    self.class.new(@components[0] / numeric,
                   @components[1] / numeric,
                   @components[2] / numeric)
  end

  alias :add :+

  alias :subtract :-

  alias :multiply :*

  alias :divide :/

  # @param (see #add)
  # @return [Vector] self after adding vector
  def add!(vector)
    @components[0] += vector.components[0]
    @components[1] += vector.components[1]
    @components[2] += vector.components[2]

    self
  end

  # @param (see #subtract)
  # @return [Vector] self after subtracting vector
  def subtract!(vector)
    @components[0] -= vector.components[0]
    @components[1] -= vector.components[1]
    @components[2] -= vector.components[2]

    self
  end

  # @param (see #multiply)
  # @return [Vector] self after multiplying by numeric
  def multiply!(numeric)
    @components[0] *= numeric
    @components[1] *= numeric
    @components[2] *= numeric

    self
  end

  # @param (see #divide)
  # @return [Vector] self after dividing by numeric
  def divide!(numeric)
    @components[0] /= numeric
    @components[1] /= numeric
    @components[2] /= numeric

    self
  end

  alias :+@ :dup

  # @return [Vector] negative vector
  def -@
    self.class.new(-@components[0],
                   -@components[1],
                   -@components[2])
  end

  # @param [Vector] position
  # @return [Numeric] distance to a position
  def distance_to(position)
    Math.sqrt((@components[0] - position.x) ** 2 +
              (@components[1] - position.y) ** 2 +
              (@components[2] - position.z) ** 2)
  end

  # @param [Vector] position
  # @return [Numeric] angle to 2D position, in radians
  def angle_to(position)
    diff = position - self
    Math.atan2(diff.y, diff.x)
  end

  # @param [Numeric] angle to move along, in radians
  # @param [Numeric] distance to move
  # @return [Vector] position moved along an angle for a distance in 2D
  def along(angle, distance)
    self.class.new(@components[0] + Math.cos(angle) * distance,
                   @components[1] + Math.sin(angle) * distance)
  end

  # @param (see #along)
  # @return [Vector] self after moving along an angle for a distance in 2D
  def along!(angle, distance)
    @components[0] += Math.cos(angle) * distance
    @components[1] += Math.sin(angle) * distance

    self
  end

  # @param [Vector] position to move to
  # @param [Vector] distance to move
  # @return [Vector] position moved toward other position for a distance in 2D
  # @todo Make work in 3D.
  def toward(position, distance)
    along angle_to(position), distance
  end

  # @param (see #toward)
  # @return [Vector] self after moving toward other position for a distance in
  #   2D
  # @todo Make work in 3D.
  def toward!(position, distance)
    along! angle_to(position), distance
  end
end
end

Yeah::V = Yeah::Vector
