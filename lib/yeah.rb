require 'naught'
require 'pow'

module Yeah
  include Naught.build { |c| c.black_hole }::Conversions

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

  desktop_backend

  game
].each { |r| require "yeah/#{r}" }
