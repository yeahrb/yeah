module Yeah; end

%i[numeric string].each { |r| require "patch/#{r}" }

%i[
  utility
  command

  vector v
  color

  entity

  stage

  game
].each { |r| require "yeah/#{r}" }
