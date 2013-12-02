require 'pow'

module Yeah
  VERSION = '0.2.2'
end

%i[numeric string].each { |r| require "monkey/#{r}" }

%i[
  utility
  command

  vector
  color

  surface
  rectangle

  entity
  basic_physics

  map

  desktop_screen

  game
].each { |r| require "yeah/#{r}" }
