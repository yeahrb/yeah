require 'pow'

module Yeah
  VERSION = '0.2.2'

  def self.load_project
    require_recursively('.')
  end

  def self.require_recursively(dir)
    Pow(dir).files.select { |f| f.extention == 'rb' }.each { |f| require f }
    Pow(dir).directories.each { |sd| require_recursively(sd) }
  end
end

require 'monkey/numeric'

%i[
  command

  vector

  color
  surface
  rectangle

  entity
  basic_physics

  map

  desktop

  game
].each { |r| require "yeah/#{r}" }
