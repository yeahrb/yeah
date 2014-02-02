module Yeah; end

%i[
  numeric
].each { |r| require "monkey/#{r}" }

%i[
  project
  command

  null_context
  null_stage
  null_visual

  vector v
  color

  entity

  stage

  game
].each { |r| require "yeah/#{r}" }
