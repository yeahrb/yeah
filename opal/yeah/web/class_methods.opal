module Yeah
module Web
  module ClassMethods
    def configure(&block)
      config = Struct.new(:title, :preserve_pixels).new

      yield config

      `window.document.title = #{config.title}` unless config.title.nil?
      `PRESERVE_PIXELS = #{config.preserve_pixels}`
    end
  end
end
end
