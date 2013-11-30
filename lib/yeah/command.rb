module Yeah::Command
  def self.new(project_name)
    structure = {}
    structure[project_name] = {
      entities: {},
      visuals: {},
      maps: {},
      assets: {},
      config: {}
    }

    Utility.make_file_structure(structure)
  end
end
