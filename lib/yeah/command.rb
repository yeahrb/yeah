module Yeah::Command
  include Yeah

  def self.new(project_name)
    Utility.make_project(project_name)
  end

  def self.run
    Utility.load_project
    Utility.run_project
  end
end
