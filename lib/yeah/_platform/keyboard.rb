module Yeah
module Platform

# The `Keyboard` provides keyboard input handling.
# @example Playing sound on key press within game
#   neigh.play if keyboard.pressed? :scroll_lock
# @abstract Provided by a `Platform`.
class Keyboard
  KEYS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, :a, :alt, :b, :backquote, :backslash,
          :backspace, :c, :caps_lock, :comma, :ctrl, :d, :delete, :dot, :down,
          :e, :end, :enter, :equals, :escape, :f, :f1, :f10, :f11, :f12, :f2,
          :f3, :f4, :f5, :f6, :f7, :f8, :f9, :fn, :g, :h, :home, :i, :insert,
          :j, :k, :l, :left, :left_bracket, :m, :minus, :n, :num0, :num1,
          :num2, :num3, :num4, :num5, :num6, :num7, :num8, :num9,
          :num_asterisk, :num_dot, :num_lock, :num_minus, :num_plus,
          :num_slash, :o, :p, :page_down, :page_up, :pause, :q, :quote, :r,
          :right, :right_bracket, :s, :scroll_lock, :semicolon, :shift, :slash,
          :super, :t, :tab, :u, :up, :v, :w, :x, :y, :z]

  # @param [Hash] options for new object
  # @option options [Ticker] :ticker for one-shot input handling
  def initialize(options = {})
    raise NotImplementedError
  end

  # @!method pressing?(key)
  # @param [Symbol, Numeric] key to check
  # @return [Boolean] whether key is pressed

  # @!method pressed?(key)
  # @param [Symbol, Numeric] key to check
  # @return [Boolean] whether key was just pressed

  # @!method released?(key)
  # @param [Symbol, Numeric] key to check
  # @return [Boolean] whether key was just released
end
end
end
