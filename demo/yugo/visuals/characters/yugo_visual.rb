class YugoVisual < Sprite
  # sheet :yugo (implicit)

  size V[16, 24]

  states {
    stand: (0..2), # or [0, 1, 2]
    run: (3..5), # or [3, 4, 5]
    jump: (6..8) # or [6, 7, 8]
  }
  # default_state :stand (implicit)
  # default_face :right (implicit)
end
