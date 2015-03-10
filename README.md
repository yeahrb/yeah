# Yeah

Practical Ruby video game framework, alpha stage

Project has been stalled after gaining a better understanding of the problem space. I started this to help me build great games. However, at some point it became clear to me that Yeah's fundamental design is not very practical for creating great games. A Processing-like drawing API is useful for drawing simple abstract graphics, though not much beyond that. A game's level of quality actually has nothing to do with its level of support for multiple disparate platforms. Ruby's flexibility comes at a non-trivial computational cost, which can be adequately worked around in a web app, but much less so in a video game. In light of this, I don't plan to continue working on Yeah. For your Ruby game prototyping needs, I recommend using [ruby-processing](https://github.com/jashkenas/ruby-processing), which has a similar but richer drawing API and is more mature & stable.

## Features

* Designed to be easy to learn and fast to build games with
* Embraces Ruby's strengths (object-orientation, duck typing, focus on developer happiness)
* Platform-agnostic (currently compiles to web pages through [Opal](http://opalrb.org); PC executables and mobile apps planned)
* Convention (over configuration)-oriented
* Processing/HTML5 Canvas-style drawing API
* Command-line utilities (no monolithic IDE)
* Open source under MIT license


## Demos

[![Rogueliek](https://i.imgur.com/HTDnncD.png)][Rogueliek]

[*Rogueliek*][Rogueliek] by [skofo](https://github.com/skofo) ([code][Rogueliek code])

[![Collisions](https://i.imgur.com/KzgTDmn.png)][Collisions]

[*Collisions*][Collisions] by [skofo](https://github.com/skofo) ([code][Collisions code])

[![Leone Mangione](https://cdn.mediacru.sh/VuuuvZYDbPet.png)][Leone Mangione]

[*Leone Mangione*][Leone Mangione] by [elia](https://github.com/elia) ([code][Leone Mangione code])

[![Asteroids](https://cdn.mediacru.sh/IkYZP46TmCsd.png)][Asteroids]

[*Asteroids*][Asteroids] by [skofo](https://github.com/skofo) ([code][Asteroids code])

[![Random](https://cdn.mediacru.sh/KW9M6TndLry0.png)][Random]

[*Random*][Random] by [skofo](https://github.com/skofo) ([code][Random code])


## Usage

NOTE: This is alpha-stage software, expect changes!

### Installation

1. Install Ruby 2.0+, visit [the Ruby website](http://ruby-lang.org/) for more info.
2. In a command line, enter `gem install yeah`.
3. Enter `yeah` to view list of commands.

### Making a game

1. In a command line, enter `yeah new` to generate a new game project.
2. Change into the new project directory, then enter `bundle install`.
3. Add game code to `code/game.rb`. No tutorials yet; please take a look at the [example code][Example code] and [API reference][0.4.2 API].
4. Enter `yeah serve` and visit [http://localhost:1234](http://localhost:1234) to try the game.


## Links

API reference: [0.4.2][0.4.2 API], [0.3.5][0.3.5 API]

[Version upgrade notes](https://github.com/yeahrb/yeah/blob/master/UPGRADING.md)

[Issue & feature tracker](https://github.com/yeahrb/yeah/issues)

[Discussion via Gitter](https://gitter.im/yeahrb/yeah)

[Author's email](mailto:skoofoo@gmail.com)


[0.4.2 API]: http://rdoc.info/github/yeahrb/yeah/32a50f5/frames
[0.3.5 API]: http://rdoc.info/github/yeahrb/yeah/5efbbc9/frames
[Asteroids]: https://skofo.github.io/asteroids/runner.html
[Asteroids code]: https://github.com/skofo/asteroids
[Random]: https://skofo.github.io/random/runner.html
[Random code]: https://github.com/skofo/random
[Leone Mangione]: http://elia.schito.me/yeah-leone-mangione/runner.html
[Leone Mangione code]: https://github.com/elia/yeah-leone-mangione
[Collisions]: https://skofo.github.io/collisions
[Collisions code]: https://github.com/skofo/collisions
[Rogueliek]: https://skofo.github.io/rogueliek
[Rogueliek code]: https://github.com/skofo/rogueliek
