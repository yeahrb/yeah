module Yeah
module Web
class Sound < Asset
  def play
    `#@native.play()`
  end

  def pause
    `#@native.pause()`
  end

  private

  def setup_native
   ` #@native = new Audio()`
  end
end
end
end
