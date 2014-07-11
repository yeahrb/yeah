module Yeah
class Game
  attr_reader :display, :keyboard, :mouse

  def initialize(args = {})
    @display = args.fetch(:display)
    @keyboard = args.fetch(:keyboard)
    @mouse = args.fetch(:mouse)

    setup
  end

  private

  def setup
    # overridable noop
  end
end
end
