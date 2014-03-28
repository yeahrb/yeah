module Yeah

class Box
  def self.size(value)
    @size = value
  end

  def initialize(size = V[], color = Color[0, 0, 0])
    class_size = self.class.instance_variable_get(:@size)
    self.size = class_size || size

    @color = color
  end

  attr_accessor :size

  attr_accessor :color
end

end
