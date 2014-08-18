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
    # @param [Hash] configuration used for new game instances
    # @option configuration [Hash] :ticker options
    # @option configuration [Hash] :display options
    # @option configuration [Hash] :keyboard options
    # @option configuration [Hash] :mouse options
    # @return [Hash] configuration for new game instances
    def config
      @config ||= {
        ticker: {},
        display: {},
        keyboard: {},
        mouse: {}
      }
    end

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

  def config
    self.class.config
  end

  def defaults
    ticker = Ticker.new(config[:ticker])

    {
      ticker: ticker,
      display: Display.new(config[:display]),
      keyboard: Keyboard.new({ ticker: ticker }.merge(config[:keyboard])),
      mouse: Mouse.new({ ticker: ticker }.merge(config[:mouse]))
    }
  end
end
end
