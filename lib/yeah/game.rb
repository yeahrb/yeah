module Yeah

# A `Game` is subclassed to create the core of a game project.
#
# A project's `Game` is instantiated at runtime. Its {#setup} is called one
# time, then {#update} is called repeatedly.
#
# I/O objects are provided and can be used to build a modern video game.
# @abstract Subclass this to make a game.
class Game
  class << self
    # @return [Game] default subclass (i.e. project game)
    def default
      subclasses.last
    end

    private

    def inherited(klass)
      subclasses << klass

      super
    end

    def subclasses
      @@subclasses ||= []
    end
  end

  # @return [Ticker] ticker used for game loop and one-shot input
  attr_reader :ticker

  # @return [Display] display for drawing
  attr_reader :display

  # @return [Keyboard] keyboard input
  attr_reader :keyboard

  # @return [Mouse] mouse input
  attr_reader :mouse

  # @param [Hash] options
  # @option options [Ticker] :ticker
  # @option options [Display] :display
  # @option options [Keyboard] :keyboard
  # @option options [Mouse] :mouse
  def initialize(options = {})
    options = defaults.merge(options)
    @ticker = options[:ticker]
    @display = options[:display]
    @keyboard = options[:keyboard]
    @mouse = options[:mouse]

    setup

    @ticker.on_tick { |e| update(e) }
  end

  # @abstract
  # Setup game at start.
  def setup
  end

  # @param [Numeric] elapsed time since last update
  # @abstract
  # Update game on tick.
  def update(elapsed)
  end

  private

  def defaults
    ticker = Ticker.new

    {
      ticker: ticker,
      display: Display.new,
      keyboard: Keyboard.new(ticker: ticker),
      mouse: Mouse.new(ticker: ticker)
    }
  end
end
end
