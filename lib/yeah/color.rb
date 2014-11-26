module Yeah

# A `Color` represents a color with an alpha value.
#
# @example Comparing two colors
#   Color.new(100, 100, 100) == Color.new('#646464')
#   # => true
class Color
  # @return [Array] color value in RGBA format
  attr_reader :value

  # @overload initialize(red, green, blue, alpha)
  #   @param [Integer] red value, from 0 to 255
  #   @param [Integer] green value, from 0 to 255
  #   @param [Integer] blue value, from 0 to 255
  #   @param [Float] alpha value, from 0.0 to 1.0, defaults to 1.0
  # @overload initialize(hex_string, alpha)
  #   @param [String] color value in hexadecimal '#dadada' or '#fff' format
  #   @param [Float] alpha value, from 0.0 to 1.0, defaults to 1.0
  def initialize(*args)
    if args[0].respond_to?(:[]) && args[0][0] == '#' # hex string
      if args[0].length == 4 # short hex
        @value = args[0][1..3].chars.map { |h| "#{h}#{h}".to_i(16) }
      else # normal hex
        @value = args[0][1..6].scan(/../).map { |h| h.to_i(16) }
      end

      @value[3] = args[1] || 1.0
    else
      @value = args
      @value[3] ||= 1.0
    end

    @hex = "##{@value[0..2].map { |v| v.to_s(16).rjust(2, '0') }.join }"
  end

  # @return [String] readable representation
  def inspect
    "#{self.class.name}#{value.to_s}"
  end

  # @return [true, false] whether self matches other color
  def ==(other)
    value == other.value
  end

  # @return [String] color value as an RGB hex string
  def to_hex
    @hex
  end
end
end
