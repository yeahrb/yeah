module Yeah
module Command
  module_function

  def new(project_name, dir = Dir.pwd)
    Project.generate(project_name, dir)
  end

  def build(dir = '.')
    Project.load(dir).build
  end
end
end
