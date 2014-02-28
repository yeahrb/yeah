require 'opal'

module Yeah
Web::Server = Rack::Builder.new do
  map '/' do
    run Player.new
  end

  map '/assets' do
    run Assets.new
  end

  class Player
    include Yeah

    def call(env)
      [200, { 'Content-Type' => 'text/html' }, [html]]
    end

    def html
      player_path = "#{PATH}/lib/yeah/web/player.html"
      player_template = File.read(player_path)
      params = {
        game_name: game_class_name,
        game_assets: game_assets,
        initializer: initializer
      }

      player_template % params
    end

    def game_assets
      script_paths = Dir.glob('**/*.rb')
      formatting = "  %s\n"

      script_paths.inject("") do |markup, script_path|
        element = "<script src=\"/assets/#{script_path}\"></script>"
        formatted_element = formatting % element
        markup << formatted_element
      end.chomp
    end

    def initializer
      element = "<script>\n%s</script>"
      initializer_path = "#{PATH}/lib/yeah/web/initializer.rb"
      initializer_template = File.read(initializer_path)
      initializer_params = {
        game_class_name: game_class_name
      }
      initializer = initializer_template % initializer_params
      compiled_initializer = Opal.compile(initializer)

      element % compiled_initializer
    end

    # TODO: Improve
    def game_class_name
      require 'yeah/utility/project'

      Yeah::Project.new.game_class_name
    end
  end

  class Assets < Opal::Environment
    def initialize(*args)
      super

      use_gem 'opal'
      append_opal_stdlib
      use_gem 'yeah'
      append_path '.'
    end

    def append_opal_stdlib
      opal_dir = Gem::Specification.find_by_name('opal').gem_dir
      append_path File.join(opal_dir, 'stdlib')
    end
  end
end
end
