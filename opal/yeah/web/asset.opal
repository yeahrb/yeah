module Yeah
module Web
class Asset
  ASSETS_PATH = "./assets"

  def initialize(path)
    setup_native

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

  private

  def setup_native
    raise NotImplementedError
  end
end
end
end
