module Yeah
module Web
class Image < Asset
  def initialize(path)
    super

    %x{
      #@native = new Image();
      #@native.src = #{full_path};
    }
  end

  def width
    `#@native.width`
  end

  def height
    `#@native.height`
  end

  def size
    [`#@native.width`, `#@native.height`]
  end

  def to_n
    @native
  end
end
end
end
