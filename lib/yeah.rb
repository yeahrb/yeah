require 'pow'

module Yeah
  VERSION = '0.2.2'

  def self.load_project
    %i(entities maps visuals).each { |d| require_recursively(d) }
  end

  def self.require_recursively(dir)
    Pow(dir).files.each { |f| require f }
    Pow(dir).directories.each { |sd| require_recursively(sd) }
  end
end

require 'monkey/numeric'

%i[
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
