module Yeah

class Look < Base
  class_attr :size, V[]

  class_attr :anchor, V[]

  one_to_one :thing, :look

  def render; end

  private

  def screen
    thing.game.context.screen
  end
end

end
