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
    @ticker = args.fetch(:ticker)
    @display = args.fetch(:display)
    @keyboard = args.fetch(:keyboard)
    @mouse = args.fetch(:mouse)

    @ticker.on_tick { update }

    setup
  end

  private

  def setup
    # overridable noop
  end

  def update
    # overridable noop
  end
end
end
