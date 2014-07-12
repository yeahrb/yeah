module Yeah
class Game
  attr_reader :display, :keyboard, :mouse

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
    {
      ticker: Ticker.new,
      display: Display.new,
      keyboard: Keyboard.new,
      mouse: Mouse.new
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
