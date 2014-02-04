require 'fileutils'

class Project
  def initialize(dir)
  end

  class << self
    alias_method :run, :new

    def generate(name, dir)
      project_dir = copy_template(name, dir)
      compile_template(project_dir, name)
      delete_keep_files(project_dir)
    end

    private

    def copy_template(name, dir)
      yeah_dir = File.expand_path('../../../', __FILE__)
      template_dir = "#{yeah_dir}/lib/template/"
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
      deep_paths = Dir.glob("**/*", File::FNM_DOTMATCH) - %w[. ..]
      deep_paths.select { |f| File.file? f }
    end

    def game_classify(name)
      classify(name) + "Game"
    end

    def classify(string)
      string
        .split('_')
        .collect { |w| w
          .sub(/\A(.)/) {
            $1.upcase
          }
        }
        .join
    end
  end
end
