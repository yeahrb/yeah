require 'naught'
require 'pow'

module Yeah
  include Naught.build(&:black_hole)::Conversions

  VERSION = '0.2.2'
end

%i[numeric string].each { |r| require "patch/#{r}" }

%i[
  utility
  command

  vector v
  color

  surface
  rectangle

  entity
  basic_physics

  stage

  desktop_window

  game
].each { |r| require "yeah/#{r}" }
