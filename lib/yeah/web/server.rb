require 'rack'
require 'opal'

module Yeah
module Web
class Server
  def start(port = 1234)
    Rack::Server.start(app: Application.new, Port: port)
  end

  private

  class Application < Opal::Server
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
end
