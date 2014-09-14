0.3.5 -> 0.4.0
--------------
* `Display` font attributes have been revised. Use `#text_font` & `#text_size` in place of `#font_family` & `#font_size`. Use `Font` instances in place of font names.
* `Display#rotate` now takes a `Vector` instead of a `Numeric`. Replace occurances of `#rotate` with `#rotate_z`.
* `Display#transformation` has been removed.
* `Game::config` has been removed. To set a game's display size, use `display.size = <vector>` in a game's `#setup`.
* Projects now have a `code/config.rb` file. Copy it over from a new 0.4 game project.
* `Web` runner now scales the display to use all available space. To preserve pixel art, set `factorial_scaling` to `true` in `config.rb`.

0.3.4 -> 0.3.5
--------------
* Entrypoint has been changed from `code/code.rb` to `code/game.rb` (contents of `code/code.rb` need to be moved to `code/game.rb`).
* `Image` does not support `#path=`.
* `Sound` does not support `#path=`, `#to_n` and `#pause` (use `#stop`).
