module Yeah
  VERSION = '0.2.2'
end

require 'monkey/numeric'

%i[
  loader

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
