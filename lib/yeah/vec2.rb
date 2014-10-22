module Yeah

# The `Vec2` module provides methods for manipulating 2-dimensional vectors.
# A vector is represented by a sequence of Numeric component values.
module Vec2
  module_function

  def equals?(ax, ay, bx, by)
    ax == bx && ay == by
  end

  def magnitude(x, y)
    Math.sqrt(x ** 2 + y ** 2)
  end

  def direction(x, y)
    Math.atan2(y, x)
  end

  alias :length :magnitude

  def normalize(x, y)
    magnitude = magnitude(x, y)
    [x / magnitude, y / magnitude]
  end

  def add(ax, ay, bx, by)
    [ax + bx, ay + by]
  end

  def subtract(ax, ay, bx, by)
    [ax - bx, ay - by]
  end

  def multiply(ax, ay, b)
    [ax * b, ay * b]
  end

  def divide(ax, ay, b)
    [ax / b, ay / b]
  end

  def dot_product(ax, ay, bx, by)
    ax * bx + ay * by
  end

  def distance_to(ax, ay, bx, by)
    Math.sqrt((ax - bx) ** 2, (ay - by) ** 2)
  end

  def direction_to(ax, ay, bx, by)
    Math.atan2(by - ay, bx - by)
  end
end

end
