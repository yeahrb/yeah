require 'pathname'
require 'erb'
require 'rack'
require 'opal'
require 'opal/sprockets/environment'

module Yeah
module Web

# The `Web::Server` serves a game over the web. To start a game web server,
# enter `yeah serve` in a command-line within a game project.
class Server
  # @param [Integer] port
  # @return [nil]
  # Start web server for game in working directory.
  def start(port = 1234)
    Opal::Processor.inline_operators_enabled = true

    runner = Runner.new

    assets = Opal::Environment.new

    # Append standard library code paths.
    $LOAD_PATH.each { |p| assets.append_path(p) }

    # Append gem code paths.
    assets.append_path gem_path.join('lib')
    assets.append_path gem_path.join('opal')

    # Append game code and asset paths.
    assets.append_path 'assets'
    assets.append_path 'code'

    source_maps = Opal::SourceMapServer.new(assets, '/assets')

    application = Rack::Builder.new do
      use Rack::Deflater

      map '/' do
        run runner
      end

      map '/assets' do
        run Rack::Cascade.new([assets, source_maps])
      end
    end

    Rack::Server.start(app: application, Port: port)
  end

  private

  def gem_path
    @gem_path ||= Pathname.new(__FILE__).join('..', '..', '..', '..')
  end

  # `Web::Runner` is a Rack app that provides the runner webpage for
  # `Web::Server`.
  # @see Yeah::Web::Server
  class Runner
    def call(environment)
      runner_path = Pathname.new(__FILE__).join('..', 'runner.html.erb')
      html = ERB.new(File.read(runner_path)).result(binding)

      [200, {'Content-Type' => 'text/html'}, [html]]
    end

    private

    def asset_include_tags
      paths = Dir['assets/**/*'].select { |p| File.file? p }

      paths.map do |path|
        case path
        when /\.(ogg|wav|mp3)$/
          "<audio src=\"/#{path}\"></audio>"
        when /\.(otf|ttf|woff)$/
          "<style>" +
          "@font-face { font-family: \"#{path[7..-1]}\"; src: url(#{path}) }" +
          "</style>"
        else
          "<img src=\"/#{path}\" />"
        end
      end.join("\n")
    end

    def script_include_tag(path)
      "<script src=\"/assets/#{path}.js\"></script>"
    end
  end
end

end
end
