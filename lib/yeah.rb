module Yeah; end

%i[numeric string].each { |r| require "patch/#{r}" }

%i[
  utility
  command

  vector v
  color

  surface
  rectangle

  entity

  stage

  desktop_window

  game
].each { |r| require "yeah/#{r}" }
