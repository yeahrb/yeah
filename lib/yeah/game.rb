module Yeah
class Game
  class << self
    def inherited(klass)
      subclasses << klass

      super
    end

    def subclasses
      @@subclasses ||= []
    end

    def config
      @config ||= {
        ticker: {},
        display: {},
        keyboard: {},
        mouse: {}
      }
    end
  end

  attr_reader :ticker, :display, :keyboard, :mouse

  def initialize(args = {})
    args = defaults.merge(args)
    @ticker = args[:ticker]
    @display = args[:display]
    @keyboard = args[:keyboard]
    @mouse = args[:mouse]

    @ticker.on_tick { |e| update(e) }

    setup
  end

  private

  def defaults
    ticker = Ticker.new(config[:ticker])

    {
      ticker: ticker,
      display: Display.new(config[:display]),
      keyboard: Keyboard.new({ ticker: ticker }.merge(config[:keyboard])),
      mouse: Mouse.new({ ticker: ticker }.merge(config[:mouse]))
    }
  end

  def config
    self.class.config
  end

  def setup
    # overridable noop
  end

  def update
    # overridable noop
  end
end
end
