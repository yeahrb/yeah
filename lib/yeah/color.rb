module Yeah
class Color
  class << self
    private :new

    def [](*args)
      new(*args)
    end
  end

  attr_reader :value

  def initialize(*args)
    if args.first.respond_to?(:[]) && args.first[0] == '#' # hex string
      @value = args.first[1..6].scan(/../).map { |h| h.to_i(16) }
    else
      @value = args
    end
  end

  def ==(other)
    value == other.value
  end

  def to_s
    "#<#{self.class.name} #{value.to_s}>"
  end

  def to_hex
    "##{value.map { |v| v.to_s(16).rjust(2, '0') }.join }"
  end
end
end

Yeah::C = Yeah::Color
