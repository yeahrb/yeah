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
      @main = 'yeah/web'
      @index_path = gem_path.join('lib', 'yeah', 'web', 'runner.html.erb').to_s

      super

      # Append stdlib paths
      $LOAD_PATH.each { |p| append_path(p) }

      # Append Yeah paths
      append_path gem_path.join('lib')
      append_path gem_path.join('opal')
    end

    private

    def gem_path
      @gem_path ||= Pathname.new(__FILE__).join('..', '..', '..', '..')
    end
  end
end
end
end
