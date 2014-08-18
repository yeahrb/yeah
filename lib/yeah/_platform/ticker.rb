module Yeah

# The `Ticker` provides a way to start a game loop.
# @example Print elapsed time between each tick
#   Ticker.new.on_tick { |elapsed| puts elapsed }
# @abstract Provided by a `Platform`.
class Ticker
  # @param [Hash] options for new object
  # @option options [Numeric] :rate (60) at ticks per second
  def initialize(options = {})
    raise NotImplementedError
  end

  # @!attribute [r] rate
  # @return [Numeric] ticks per second intended

  # @!method on_tick
  # @yield [elapsed] block to execute per tick
  # @yieldparam [Numeric] elapsed time since last tick
end
end
