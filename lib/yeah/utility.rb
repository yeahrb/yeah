module Yeah::Utility
  def self.make_project(name)
    structure = project_structure(name)
    generate_files_from_structure(structure)
  end

  def self.load_project
    require_recursively('.')
  end

  def self.run_project
    project_game.new.start
  end

  # TODO: do Game#map_queue instead.
  def self.first_map
    map_class_name = Dir['maps/*'].first[5..-4].classify
    Kernel.const_get(map_class_name)
  end

  private # in practice

  def self.project_structure(name)
    structure = {}
    structure[name.to_sym] = {
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

    structure
  end

  # TODO: clean this up
  def self.generate_files_from_structure(structure)
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

  def self.require_recursively(dir)
    pow_spells_correctly = Pow::Base.method_defined? :extension
    if !pow_spells_correctly
      Pow::Base.class_eval "alias_method :extension, :extention"
    end

    Pow(dir).files.select { |f| f.extension == 'rb' }.each { |f| require f }
    Pow(dir).directories.each { |sd| require_recursively(sd) }
  end

  def self.project_game
    game_class_name = Object.constants.find { |c| c[-4..-1] == "Game" }
    Kernel.const_get(game_class_name)
  end
end