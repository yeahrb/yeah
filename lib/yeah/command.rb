module Yeah::Command
  def self.new(project_name)
    structure = {}
    structure[project_name] = {
      entities: {},
      visuals: {},
      maps: {},
      assets: {},
      config: {},
      'game.rb' => <<-eoc.unindent
        require "yeah"
        include Yeah

        class #{project_name.classify}Game < Game
        end
      eoc
    }

    Utility.make_file_structure(structure)
  end
end
