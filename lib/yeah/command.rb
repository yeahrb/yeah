module Yeah::Command
  def self.new(project_name)
    Dir.mkdir(project_name)

    subdirs = %i[entities visuals maps assets config]
    subdirs.each { |sd| Dir.mkdir("#{project_name}/#{sd}") }
  end
end
