class Yeah::Vector
  def initialize(*components)
    @components = components.empty? ? [0, 0, 0] : components
  end

  def self.[](*components)
    self.new(*components)
  end

  def components
    @components
  end
end
