module Yeah
module Platform

# `Mouse` provides mouse input handling.
# @example Attack on button press within game
#   attack if mouse.pressed? :left
class Mouse
  BUTTONS = [:left, :middle, :right, 4, 5]

  # @param [Hash] options for new object
  # @option options [Ticker] :ticker for one-shot input handling
  def initialize(options = {})
    raise NotImplementedError
  end

  # @!method pressing?(button)
  # @param [Symbol, Numeric] button to check
  # @return [Boolean] whether button is pressed

  # @!method pressed?(button)
  # @param [Symbol, Numeric] button to check
  # @return [Boolean] whether button was just pressed

  # @!method released?(button)
  # @param [Symbol, Numeric] button to check
  # @return [Boolean] whether button was just released
end
end
end
