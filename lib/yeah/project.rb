require 'pow'

# TODO: Heavily refactor, add smarter file management
class Project
  class << self
    def load(dir='.')
      require_recursively(dir)
      send(:new)
    end

    def generate(name, dir='.')
      structure = file_structure(name)
      generate_files_from_structure(structure)
      self.load("#{dir}/#{name}")
    end

    private

    def require_recursively(dir)
      alias_extention = "alias_method :extension, :extention"
      pow_spells_correctly = Pow::Base.method_defined? :extension
      Pow::Base.class_eval(alias_extention) unless pow_spells_correctly

      Pow(dir).files.select { |f| f.extension == 'rb' }.each { |f| require f }
      Pow(dir).directories.each { |sd| require_recursively(sd) }
    end

    def extend_string(string)
      string = String.new(string)

      def string.unindent
        gsub(/^#{self[/\A\s*/]}/, '').strip
      end

      def string.classify
        split('_').collect { |w| w.sub(/\A(.)/){ $1.upcase } }.join
      end

      string
    end

    def file_structure(name)
      structure = {}

      game_class_prefix = extend_string(name).classify
      game_class_name = "#{game_class_prefix}Game"
      game_rb = <<-eoc
        require "yeah"
        include Yeah

        class #{game_class_name} < Game
        end
      eoc
      game_rb = extend_string(game_rb).unindent

      structure[name.to_sym] = {
        entities: {},
        visuals: {},
        maps: {},
        assets: {},
        config: {},
        'game.rb' => game_rb
      }

      structure
    end

    def generate_files_from_structure(structure)
      make_recursively = lambda do |struct, base_loc=""|
        struct.each do |key, value|
          new_loc = "#{base_loc}#{key}"

          case value
          when Hash
            new_dir = "#{new_loc}/"
            Dir.mkdir(new_dir)
            make_recursively.call struct[key], new_dir
          when String
            File.open(new_loc, 'w') { |f| f.write(value) }
          end
        end
      end

      make_recursively.call structure
    end
  end

  def run
    game.new.start
  end

  def game
    game_class_name = Object.constants.find { |c| c[-4..-1] == "Game" }
    Kernel.const_get(game_class_name)
  end
end
