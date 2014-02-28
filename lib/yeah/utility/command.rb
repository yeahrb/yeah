module Yeah
module Command
  module_function

  def new(project_name, dir = Dir.pwd)
    Project.generate(project_name, dir)
  end

  def run(dir = '.')
    Project.load(dir).run
  end
end
end
