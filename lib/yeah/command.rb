module Yeah::Command
  include Yeah

  module_function

  def new(project_name)
    Project.generate(project_name)
  end

  def run
    Project.load.run
  end
end
