module Yeah

# `Mouse` provides mouse input handling.
# @example Attack on button press within game
#   attack if mouse.pressed? :left
# @note Provided by a `Platform`.
class Mouse
  BUTTONS = [:left, :middle, :right, 4, 5]

  # @param [Hash] options for new object
  # @option options [Ticker] :ticker for one-shot input handling
  # @option options [String] :canvas_selector ('canvas') for canvas HTML
  #   element (applicable only to `Web::Mouse`)
  def initialize(options = {})
    raise NotImplementedError
  end

  # @!attribute x [r]
  # @return [Integer] x position of mouse cursor

  # @!attribute y [r]
  # @return [Integer] y position of mouse cursor

  # @!attribute position [r]
  # @return [(Integer, Integer)] position of mouse cursor

  # @!method pressing?(button)
  # @param [Symbol, Numeric] button to check
  # @return [true, false] whether button is pressed

  # @!method pressed?(button)
  # @param [Symbol, Numeric] button to check
  # @return [true, false] whether button was just pressed

  # @!method released?(button)
  # @param [Symbol, Numeric] button to check
  # @return [true, false] whether button was just released
end
end
