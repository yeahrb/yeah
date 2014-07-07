require 'pathname'
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

      gem_path = Pathname.new(__FILE__).join('..', '..', '..', '..')
      append_path gem_path.join('lib')
      append_path gem_path.join('opal')

      self.main = 'yeah/web'
    end
  end
end
end
end
