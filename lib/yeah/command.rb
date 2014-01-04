module Yeah::Command
  include Yeah

  module_function

  def new(project_name)
    Utility.make_project(project_name)
  end

  def run
    Utility.load_project
    Utility.run_project
  end
end
