require 'fileutils'
require 'pathname'
require 'yeah/platforms/web'

module Yeah
class Project
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

  def initialize(dir='.')
    @dir = Pathname.new(dir)
  end

  def build
    Web::Builder.build

    puts "Built project to /builds/web/."
  end

  def game_class_name
    game_code = File.read(@dir.join('game.rb'))
    game_code.match(/class (\w+)/)[1]
  end
end
end
