module Yeah::Command
  include Yeah

  module_function

  def new(project_name, dir = Dir.pwd)
    Project.create(project_name, dir)
  end

  def run(dir = '.')
    Project.run(dir)
  end
end
