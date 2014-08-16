module Yeah
class Color
  class << self
    def [](*args)
      new(*args)
    end
  end

  attr_reader :value

  def initialize(*args)
    if args[0].respond_to?(:[]) && args[0][0] == '#' # hex string
      if args[0].length == 4 # short hex
        @value = args[0][1..3].chars.map { |h| "#{h}#{h}".to_i(16) }
      else # normal hex
        @value = args[0][1..6].scan(/../).map { |h| h.to_i(16) }
      end
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
