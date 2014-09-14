module Yeah
module Web
  module ClassMethods
    def configure(&block)
      config = Struct.new(:title, :factorial_scaling).new

      yield config

      `window.document.title = #{config.title}` unless config.title.nil?
      `FACTORIAL_SCALING = #{config.factorial_scaling}`
    end
  end
end
end
