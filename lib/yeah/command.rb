module Yeah::Command
  include Yeah

  def self.new(project_name)
    Utility.make_project(project_name)
  end
end
