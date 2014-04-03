module Yeah

class Invisible
  def size
    @size ||= V[]
  end
  attr_writer :size

  def render; end
end

end
