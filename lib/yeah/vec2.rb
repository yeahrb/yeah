module Yeah

# `Vec2` provides methods for manipulating 2-dimensional vectors.
#
# A vector is represented by a sequence of Numeric component values.
module Vec2
  class << self
    # @param [Numeric] x component of first vector
    # @param [Numeric] y component of first vector
    # @param [Numeric] x component of second vector
    # @param [Numeric] y component of second vector
    # @return [true, false] whether vectors are equal
    def equal?(ax, ay, bx, by)
      ax == bx && ay == by
    end

    # @param [Numeric] x component
    # @param [Numeric] y component
    # @return [Numeric] magnitude of vector
    def magnitude(x, y)
      Math.sqrt(x ** 2 + y ** 2)
    end

    alias :length :magnitude

    # @param [Numeric] x component
    # @param [Numeric] y component
    # @return [Numeric] angle of vector in radians
    def direction(x, y)
      Math.atan2(y, x)
    end

    # @param [Numeric] x component
    # @param [Numeric] y component
    # @return [(Numeric, Numeric)] vector of same direction with a
    #   magnitude of 1
    def normalize(x, y)
      mag = magnitude(x, y)
      [x / mag, y / mag]
    end

    # @param [Numeric] x component of first vector
    # @param [Numeric] y component of first vector
    # @param [Numeric] x component of second vector
    # @param [Numeric] y component of second vector
    # @return [(Numeric, Numeric)] vector sum
    def add(ax, ay, bx, by)
      [ax + bx, ay + by]
    end

    # @param [Numeric] x component of first vector
    # @param [Numeric] y component of first vector
    # @param [Numeric] x component of second vector
    # @param [Numeric] y component of second vector
    # @return [(Numeric, Numeric)] vector difference
    def subtract(ax, ay, bx, by)
      [ax - bx, ay - by]
    end

    # @param [Numeric] x component of first vector
    # @param [Numeric] y component of first vector
    # @param [Numeric] x component of second vector
    # @param [Numeric] y component of second vector
    # @return [(Numeric, Numeric)] vector product
    def multiply(ax, ay, b)
      [ax * b, ay * b]
    end

    # @param [Numeric] x component of first vector
    # @param [Numeric] y component of first vector
    # @param [Numeric] scalar value to multiply by
    # @return [(Numeric, Numeric)] vector quotient
    def divide(ax, ay, b)
      [ax / b, ay / b]
    end

    # @param [Numeric] x component of first vector
    # @param [Numeric] y component of first vector
    # @param [Numeric] x component of second vector
    # @param [Numeric] y component of second vector
    # @return [(Numeric, Numeric)] vector dot product
    def dot_product(ax, ay, bx, by)
      ax * bx + ay * by
    end

    # @param [Numeric] x component of first vector
    # @param [Numeric] y component of first vector
    # @param [Numeric] x component of second vector
    # @param [Numeric] y component of second vector
    # @return [Numeric] distance from first vector to second vector
    def distance_to(ax, ay, bx, by)
      Math.sqrt((ax - bx) ** 2 + (ay - by) ** 2)
    end

    # @param [Numeric] x component of first vector
    # @param [Numeric] y component of first vector
    # @param [Numeric] x component of second vector
    # @param [Numeric] y component of second vector
    # @return [Numeric] angle from first vector to second vector in radians
    def direction_to(ax, ay, bx, by)
      Math.atan2(by - ay, bx - by)
    end
  end
end

end
