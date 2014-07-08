module Yeah
module Web
class Image
  ASSETS_PATH = "/assets"

  def initialize(path)
   ` #@native = new Image();`

    self.path = path
  end

  def path
    `#@native.src`.sub(/.*:\/\/.*#{ASSETS_PATH}\//i, '')
  end
  def path=(val)
    # TODO: use Pathname#join if it is implemented in Opal
    full_path = "#{ASSETS_PATH}/#{val}"
    `#@native.src = #{full_path};`
  end

  def to_n
    @native
  end
end
end
end
