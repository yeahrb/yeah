module Yeah

class Invisible
  def size
    @size ||= V[]
  end
  attr_writer :size

  def thing
    @thing ||= Thing.new
  end
  def thing=(val)
    @thing = val
    @thing.visual = self unless @thing.visual == self
  end

  def render; end
end

end
