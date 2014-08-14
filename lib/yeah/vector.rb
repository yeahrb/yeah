require 'forwardable'

module Yeah
class Vector
  extend Forwardable

  class << self
    def [](*args)
      new(*args)
    end
  end

  attr_reader :components
  alias_method :to_a, :components
  def_delegators :@components, :[]

  def initialize(*components)
    @components = components
  end

  %i[x y z].each_with_index do |component, i|
    define_method(component) { @components[i] }
    define_method("#{component}=") { |v| @components[i] = v }
  end

  def +(vector)
    self.class.new(*(0...@components.count).map { |i|
      @components[i] + vector.components[i]
    })
  end

  def -(vector)
    self.class.new(*(0...@components.count).map { |i|
      @components[i] - vector.components[i]
    })
  end

  def *(number)
    self.class.new(*(0...@components.count).map { |i|
      @components[i] * number
    })
  end

  def /(number)
    self.class.new(*(0...@components.count).map { |i|
      @components[i] / number
    })
  end

  def +@
    self.class.new(@components)
  end

  def -@
    self.class.new(*(0...@components.count).map { |i| -@components[i] })
  end

  def distance_to(position)
    Math.sqrt((x - position.x) ** 2 + (y - position.y) ** 2)
  end

  def direction_to(position)
    diff = position - self
    Math.atan2(diff.y, diff.x)
  end

  def move_along(direction, amount)
    self.x += Math.cos(direction) * amount
    self.y += Math.sin(direction) * amount

    self
  end

  def move_toward(position, amount)
    move_along(direction_to(position), amount)
  end
end
end

Yeah::V = Yeah::Vector
