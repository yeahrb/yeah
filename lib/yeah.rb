module Yeah; end

%i[numeric string].each { |r| require "patch/#{r}" }

%i[
  null_object
  black_hole

  utility
  command

  vector v
  color

  entity

  stage

  game
].each { |r| require "yeah/#{r}" }
