0.3.4 -> 0.3.5
--------------
* Entrypoint has been changed from `code/code.rb` to `code/game.rb` (contents of `code/code.rb` need to be moved to `code/game.rb`).
* `Image` does not support `#path=`.
* `Sound` does not support `#path=`, `#to_n` and `#pause` (use `#stop`).
