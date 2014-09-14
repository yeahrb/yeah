module Yeah
module Web
  module ClassMethods
    require 'ostruct'

    def configure(&block)
      config = OpenStruct.new

      yield config

      `window.document.title = #{config.title}` unless config.title.nil?
    end
  end
end
end
