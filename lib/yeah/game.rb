module Yeah
class Game
  attr_reader :display, :keyboard, :mouse

  def initialize(args = {})
    @ticker = args.fetch(:ticker)
    @display = args.fetch(:display)
    @keyboard = args.fetch(:keyboard)
    @mouse = args.fetch(:mouse)

    setup(args)
  end

  private

  def setup(args)
    # overridable noop
  end
end
end
