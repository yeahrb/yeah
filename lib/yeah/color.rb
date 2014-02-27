module Yeah
class Color
  class << self
    alias_method :[], :new
  end

  def initialize(*args)
    args = args.first.rgb if args.first.respond_to?(:rgb)
    args.flatten!

    self.rgb = args
  end

  def to_s
    "#{self.class.name}#{rgb.to_s}"
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

  def rgb
    [red, green, blue]
  end
  def rgb=(value)
    self.red, self.green, self.blue = value
  end

  def ==(other)
    other.respond_to?(:rgb) && self.rgb == other.rgb
  end
end
end
