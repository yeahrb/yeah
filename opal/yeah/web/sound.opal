module Yeah
module Web
class Sound < Asset
  def play
    `#@native.play();`
  end

  private

  def setup_native
   ` #@native = new Audio();`
  end
end
end
end
