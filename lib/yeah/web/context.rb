module Yeah
module Web

class Context
  include Opal

  def initialize
    @canvas = Native::Object.new(`document.getElementsByTagName('canvas')[0]`)
    @gl = @canvas.getContext('webgl')
  end
end

end
end
