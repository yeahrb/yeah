module Yeah

# A `Sound` is an audio asset, which can be used to provide music and sound
# effects for a game.
# @example Playing a sound
#   Sound['sounds/neigh.wav'].play
# @note Provided by a `Platform`.
class Sound < Asset
  # @!method play
  # Play sound.

  # @!method stop
  # Stop all playback.
end
end
