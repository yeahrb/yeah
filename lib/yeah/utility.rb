module Yeah::Utility
  def self.make_project(name)
    structure = {}
    structure[name] = {
      entities: {},
      visuals: {},
      maps: {},
      assets: {},
      config: {},
      'game.rb' => <<-eoc.unindent
        require "yeah"
        include Yeah

        class #{name.classify}Game < Game
        end
      eoc
    }

    make_file_structure(structure)
  end

  # TODO: clean up this monster
  def self.make_file_structure(structure)
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

  def self.load_project
    require_recursively('.')
  end

  def self.require_recursively(dir)
    Pow(dir).files.select { |f| f.extension == 'rb' }.each { |f| require f }
    Pow(dir).directories.each { |sd| require_recursively(sd) }
  end

  def self.project_game_class
    game_class_name = Object.constants.find { |c| c[-4..-1] == "Game" }
    Kernel.const_get(game_class_name)
  end

  def self.run_project
    project_game_class.new.start
  end
end
