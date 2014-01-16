module Yeah::Utility
  module_function

  def make_project(name)
    structure = project_structure(name)
    generate_files_from_structure(structure)
  end

  def load_project
    require_recursively('.')
  end

  def run_project
    project_game.new.start
  end

  # TODO: do Game#map_queue instead.
  def first_map
    map_class_name = Dir['maps/*'].first[5..-4].classify
    Kernel.const_get(map_class_name)
  end

  def project_structure(name)
    structure = {}

    game_class_root = extend_string(name).classify
    game_rb = <<-eoc
      require "yeah"
      include Yeah

      class #{game_class_root}Game < Game
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

  # TODO: clean this up
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

  def require_recursively(dir)
    pow_spells_correctly = Pow::Base.method_defined? :extension
    if !pow_spells_correctly
      Pow::Base.class_eval "alias_method :extension, :extention"
    end

    Pow(dir).files.select { |f| f.extension == 'rb' }.each { |f| require f }
    Pow(dir).directories.each { |sd| require_recursively(sd) }
  end

  def project_game
    game_class_name = Object.constants.find { |c| c[-4..-1] == "Game" }
    Kernel.const_get(game_class_name)
  end

  def extend_string(string)
    def string.unindent
      gsub(/^#{self[/\A\s*/]}/, '').strip
    end

    def string.classify
      split('_').collect { |w| w.sub(/\A(.)/){ $1.upcase } }.join
    end

    string
  end
end
