module Yeah

# A `Color` represents a color.
#
# `C` is an alias for `Color`.
# @example Comparing two colors
#   C[100, 100, 100] == C['#646464']
#   # => true
class Color
  class << self
    # @param arguments catch-all
    # @return [Vector]
    # Alias for ::new.
    def [](*args)
      new(*args)
    end
  end

  # @return [Array] color value in RGB format
  attr_reader :value

  # @overload initialize(red, green, blue)
  #   @param [Numeric] red value, from 0 to 255
  #   @param [Numeric] green value, from 0 to 255
  #   @param [Numeric] blue value, from 0 to 255
  # @overload initialize(hex_string)
  #   @param [String] hex string in '#dadada' or '#fff' format
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

  # @return [String] readable representation
  def inspect
    "#{self.class.name}#{value.to_s}"
  end

  # @return [Boolean] whether self matches other color
  def ==(other)
    value == other.value
  end

  # @return [String] color value as a hex string
  def to_hex
    "##{value.map { |v| v.to_s(16).rjust(2, '0') }.join }"
  end
end
end

Yeah::C = Yeah::Color
