module Yeah; end

%i[numeric string].each { |r| require "patch/#{r}" }

%i[
  utility
  command

  null_context
  null_stage

  preferred_context

  vector v
  color

  entity

  stage

  game
].each { |r| require "yeah/#{r}" }
