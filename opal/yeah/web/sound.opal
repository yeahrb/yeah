module Yeah
module Web
class Sound < Asset
  def initialize(path)
    super

    %x{
      #@native = new Audio();
      #@native.src = #{full_path};
    }
  end

  def play
    `#@native.play()`
  end
end
end
end
