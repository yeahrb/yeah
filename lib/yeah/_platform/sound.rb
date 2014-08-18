module Yeah

# A `Sound` is an audio asset, which can be used to provide music and sound
# effects for a game.
# @example Playing a sound
#   Sound['sounds/neigh.wav'].play
# @abstract Provided by a `Platform`.
class Sound < Asset
  # @!method play
  # Play sound.

  # @!method pause
  # Pause sound. A following call to {#play} will resume.
end
end
