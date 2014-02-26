require 'opal'

Yeah::Web::Server = Rack::Builder.new do
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
      player_path = "#{PATH}/lib/yeah/utility/player.html"
      player_template = File.read(player_path)
      params = {
        game_name: "Game",
        game_assets: game_assets
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
  end

  class Assets < Opal::Environment
    def initialize(*args)
      super

      use_gem 'yeah'
      append_path '.'
    end
  end
end
