require 'fileutils'
require 'rack'
require 'opal'

class Yeah::Project
  include Yeah

  class << self
    def generate(name, dir)
      project_dir = copy_template(dir, name)
      compile_template(project_dir, name)
      delete_keep_files(project_dir)
    end

    alias_method :load, :new

    private

    def copy_template(dir, name)
      template_dir = "#{PATH}/lib/yeah/utility/template/"
      project_dir = "#{dir}/#{name}/"

      FileUtils.cp_r(template_dir, project_dir)

      project_dir
    end

    def compile_template(dir, game_name)
      files = deep_files(dir)

      files.each do |file|
        template = File.read(file)
        game_class = game_classify(game_name)
        properties = { game_class: game_class }
        compiled = template % properties

        IO.write(file, compiled)
      end
    end

    def delete_keep_files(dir)
      keep_files(dir).each { |f| File.delete f }
    end

    def keep_files(dir)
      deep_files(dir).select { |f| File.split(f).last == '.keep' }
    end

    def deep_files(dir)
      deep_paths(dir).select { |f| File.file? f }
    end

    def deep_directories(dir)
      deep_paths(dir).select { |f| File.directory? f }
    end

    def deep_paths(dir)
      Dir.glob("#{dir}**/*", File::FNM_DOTMATCH) - %w[. ..]
    end

    def game_classify(name)
      classify(name) + "Game"
    end

    def classify(string)
      string
        .split('_')
        .collect { |w| w
          .sub(/\A(.)/) { $1
            .upcase
          }
        }
        .join
    end
  end

  def initialize(dir)
    @dir = dir
  end

  def run
    Rack::Server.start(app: Yeah::WebServer, Port: 1234)
  end
end

Yeah::WebServer = Rack::Builder.new do
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
