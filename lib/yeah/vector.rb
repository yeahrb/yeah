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
  def_delegators :@components, :[]

  def initialize(*components)
    @components = components + [0] * (3 - components.size)
  end

  %i[x y z].each_with_index do |component, i|
    define_method(component) { @components[i] }
    define_method("#{component}=") { |v| @components[i] = v }
  end

  def magnitude
    Math.sqrt(@components[0] ** 2 + @components[1] ** 2 + @components[2] ** 2)
  end

  def normalize
    self / magnitude
  end

  def +(vector)
    self.class.new(*
      [@components, vector.components].transpose.map { |cc|
        cc.reduce(:+) })
  end

  def -(vector)
    self.class.new(*
      [@components, vector.components].transpose.map { |cc|
        cc.reduce(:-) })
  end

  def *(numeric)
    self.class.new(*@components.map { |c| c * numeric })
  end

  def /(numeric)
    self.class.new(*@components.map { |c| c / numeric })
  end

  def +@
    self.class.new(*@components)
  end

  def -@
    self.class.new(*@components.map(&:-@))
  end

  def distance_to(position)
    Math.sqrt((x - position.x) ** 2 +
              (y - position.y) ** 2 +
              (z - position.z) ** 2)
  end

  def angle_to(position)
    diff = position - self
    Math.atan2(diff.y, diff.x)
  end

  def along(angle, amount)
    self.class.new(x + Math.cos(angle) * amount, y + Math.sin(angle) * amount)
  end

  def along!(angle, amount)
    self.x += Math.cos(angle) * amount
    self.y += Math.sin(angle) * amount
    self
  end

  def toward(position, amount)
    along angle_to(position), amount
  end

  def toward!(position, amount)
    along! angle_to(position), amount
  end
end
end

Yeah::V = Yeah::Vector
