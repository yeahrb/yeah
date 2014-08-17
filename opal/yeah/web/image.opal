module Yeah
module Web
class Image < Asset
  def size
    V[`#@native.width`, `#@native.height`]
  end

  def width
    `#@native.width`
  end

  def height
    `#@native.height`
  end

  private

  def setup_native
   `#@native = new Image();`
  end
end
end
end
