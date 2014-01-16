class Yeah::Color
  class << self
    alias_method :[], :new
  end

  def initialize(re = 0, gr = 0, bl = 0, al = 1)
    self.rgba = re, gr, bl, al
  end

  def to_s
    "#{self.class.name}#{rgba.to_s}"
  end

  def red
    @red ||= 0
  end
  attr_writer :red

  def blue
    @blue ||= 0
  end
  attr_writer :blue

  def green
    @green ||= 0
  end
  attr_writer :green

  def alpha
    @alpha ||= 1
  end
  attr_writer :alpha

  def rgba
    [red, green, blue, alpha]
  end
  def rgba=(value)
    self.red, self.green, self.blue, self.alpha = value
  end

  def ==(other)
    other.respond_to?(:rgba) && self.rgba == other.rgba
  end
end
