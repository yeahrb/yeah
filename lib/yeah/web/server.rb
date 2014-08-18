require 'pathname'
require 'rack'
require 'opal'

module Yeah
module Web

# The `Web::Server` serves a game over the Internet. It can be started easily
# by entering `yeah serve` in a command-line within a game project.
class Server
  # @param [Integer] port to serve game over
  # Start serving the game.
  def start(port = 1234)
    Rack::Server.start(app: Application.new, Port: port)
  end

  private

  # For internal usage.
  # @see Yeah::Web::Server
  class Application < Opal::Server
    def initialize
      @index_path = gem_path.join('lib', 'yeah', 'web', 'runner.html.erb').to_s

      super

      # Append stdlib paths
      $LOAD_PATH.each { |p| append_path(p) }

      # Append Yeah paths
      append_path gem_path.join('lib')
      append_path gem_path.join('opal')

      # Append game (working directory) paths
      append_path 'assets'
      append_path 'code'
    end

    def asset_include_tags
      paths = Dir['assets/**/*'].select { |p| File.file? p }

      paths.map do |path|
        case path
        when /\.(ogg|wav|mp3)$/
          "<audio src=\"#{path}\"></audio>"
        else
          "<img src=\"#{path}\" />"
        end
      end.join("\n")
    end

    private

    def gem_path
      @gem_path ||= Pathname.new(__FILE__).join('..', '..', '..', '..')
    end
  end
end
end
end
