require 'opal'

module Yeah
module Web
class Server < Opal::Server
  def initialize
    super

    $LOAD_PATH.each { |p| append_path(p) }
    append_path 'lib'
    append_path 'opal'
    self.main = 'yeah/web'
  end
end
end
end
