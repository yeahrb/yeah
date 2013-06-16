class Yeah::Vector
  class << self
    alias_method :[], :new
  end

  def initialize(*components)
    if components.size > 3
      error_message = "too many arguments (#{components.size} for up to 3)"
      raise ArgumentError, error_message
    end

    @components = components + [0] * (3 - components.size)
  end

  def components
    @components
  end
end
