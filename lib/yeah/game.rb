module Yeah
class Game
  attr_reader :ticker, :display, :keyboard, :mouse

  def self.inherited(klass)
    self.subclasses << klass

    super
  end

  def self.subclasses
    @@subclasses ||= []
  end

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
    ticker = Ticker.new

    {
      ticker: ticker,
      display: Display.new,
      keyboard: Keyboard.new(ticker: ticker),
      mouse: Mouse.new(ticker: ticker)
    }
  end

  def setup
    # overridable noop
  end

  def update
    # overridable noop
  end
end
end
