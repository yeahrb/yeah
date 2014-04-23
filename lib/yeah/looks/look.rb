module Yeah

class Look < Base
  class_attr :size, V[]

  class_attr :anchor, V[]

  def thing
    @thing ||= Thing.new
  end
  def thing=(val)
    @thing = val
    @thing.look = self unless @thing.look == self
  end

  def render; end

  private

  def screen
    thing.game.context.screen
  end
end

end
