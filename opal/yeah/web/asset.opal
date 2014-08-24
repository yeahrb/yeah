module Yeah
module Web
class Asset
  ASSETS_PATH = "./assets"

  attr_reader :path

  class << self
    def [](*args)
      new(*args)
    end
  end

  def initialize(path)
    @path = path
  end

  private

  def full_path
    "#{ASSETS_PATH}/#{@path}"
  end
end
end
end
