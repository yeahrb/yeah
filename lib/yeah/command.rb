module Yeah::Command
  def self.new(project_name)
    Utility.make_project(project_name)
  end
end
