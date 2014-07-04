module Yeah
module Web
class Image
  def initialize(path)
    %x{
      #@image = new Image();
      #@image.src = #{path};
    }
  end

  def to_n
    @image
  end
end
end
end
