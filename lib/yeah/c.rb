module Yeah
class C
  class << self
    private :new

    def [](*args)
      new(*args)
    end
  end

  attr_reader :value

  def initialize(*args)
    @value = args
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
