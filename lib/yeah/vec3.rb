module Yeah

# `Vec3` provides methods for manipulating 3-dimensional vectors.
#
# A vector is represented by a sequence of Numeric component values.
module Vec3
  class << self
    # @param [Numeric] x component of first vector
    # @param [Numeric] y component of first vector
    # @param [Numeric] z component of first vector
    # @param [Numeric] x component of second vector
    # @param [Numeric] y component of second vector
    # @param [Numeric] z component of second vector
    # @return [true, false] whether vectors are equal
    def equal?(ax, ay, az, bx, by, bz)
      ax == bx && ay == by && az == bz
    end

    # @param [Numeric] x component
    # @param [Numeric] y component
    # @param [Numeric] z component
    # @return [Numeric] magnitude of vector
    def magnitude(x, y, z)
      Math.sqrt(x ** 2 + y ** 2 + z ** 2)
    end

    alias :length :magnitude

    # @param [Numeric] x component
    # @param [Numeric] y component
    # @param [Numeric] z component
    # @return [(Numeric, Numeric, Numeric)] vector of same direction with a
    #   magnitude of 1
    def normalize(x, y, z)
      mag = magnitude(x, y, z)
      [x / mag, y / mag, z / mag]
    end

    # @param [Numeric] x component of first vector
    # @param [Numeric] y component of first vector
    # @param [Numeric] z component of first vector
    # @param [Numeric] x component of second vector
    # @param [Numeric] y component of second vector
    # @param [Numeric] z component of second vector
    # @return [(Numeric, Numeric, Numeric)] vector sum
    def add(ax, ay, az, bx, by, bz)
      [ax + bx, ay + by, az + bz]
    end

    # @param [Numeric] x component of first vector
    # @param [Numeric] y component of first vector
    # @param [Numeric] z component of first vector
    # @param [Numeric] x component of second vector
    # @param [Numeric] y component of second vector
    # @param [Numeric] z component of second vector
    # @return [(Numeric, Numeric, Numeric)] vector difference
    def subtract(ax, ay, az, bx, by, bz)
      [ax - bx, ay - by, az - bz]
    end

    # @param [Numeric] x component of first vector
    # @param [Numeric] y component of first vector
    # @param [Numeric] z component of first vector
    # @param [Numeric] x component of second vector
    # @param [Numeric] y component of second vector
    # @param [Numeric] z component of second vector
    # @return [(Numeric, Numeric, Numeric)] vector product
    def multiply(ax, ay, az, b)
      [ax * b, ay * b, az * b]
    end

    # @param [Numeric] x component of first vector
    # @param [Numeric] y component of first vector
    # @param [Numeric] z component of first vector
    # @param [Numeric] scalar value to multiply by
    # @return [(Numeric, Numeric, Numeric)] vector quotient
    def divide(ax, ay, az, b)
      [ax / b, ay / b, az / b]
    end

    # @param [Numeric] x component of first vector
    # @param [Numeric] y component of first vector
    # @param [Numeric] z component of first vector
    # @param [Numeric] x component of second vector
    # @param [Numeric] y component of second vector
    # @param [Numeric] z component of second vector
    # @return [Numeric] vector dot product
    def dot_product(ax, ay, az, bx, by, bz)
      ax * bx + ay * by + az * bz
    end

    # @param [Numeric] x component of first vector
    # @param [Numeric] y component of first vector
    # @param [Numeric] z component of first vector
    # @param [Numeric] x component of second vector
    # @param [Numeric] y component of second vector
    # @param [Numeric] z component of second vector
    # @return [(Numeric, Numeric, Numeric)] vector dot product
    def cross_product(ax, ay, az, bx, by, bz)
      [ay * bz - az * by, az * bx - ax * bz, ax * by - ay * bx]
    end

    # @param [Numeric] x component of first vector
    # @param [Numeric] y component of first vector
    # @param [Numeric] z component of first vector
    # @param [Numeric] x component of second vector
    # @param [Numeric] y component of second vector
    # @param [Numeric] z component of second vector
    # @return [Numeric] distance from first vector to second vector
    def distance_to(ax, ay, az, bx, by, bz)
      Math.sqrt((ax - bx) ** 2 + (ay - by) ** 2 + (az - bz) ** 2)
    end
  end
end

end
