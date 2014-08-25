# Yeah

Practical Ruby video game framework, alpha stage


## Features

* Designed to be easy to learn and fast to build games with
* Embraces Ruby's strengths (object-orientation, duck typing, focus on developer happiness)
* Platform-agnostic (currently compiles to web pages through [Opal](http://opalrb.org); PC executables and mobile apps planned)
* Convention (over configuration)-oriented
* Processing/HTML5 Canvas-style drawing API
* Command-line utilities (no monolithic IDE)
* Open source under MIT license


## Examples

[Code for all examples](https://github.com/yeahrb/examples)

[![Asteroids](https://cdn.mediacru.sh/IkYZP46TmCsd.png)](https://yeahrb.github.io/examples/asteroids/runner.html)

[*Asteroids*](https://yeahrb.github.io/examples/asteroids/runner.html)

[![Random](https://cdn.mediacru.sh/KW9M6TndLry0.png)](https://yeahrb.github.io/examples/random/runner.html)

[*Random*](https://yeahrb.github.io/examples/random/runner.html)


## Usage

NOTE: This is alpha-stage software, expect changes!

### Installation

1. Install Ruby 2.0+, visit [the Ruby website](http://ruby-lang.org/) for more info.
2. In a command line, enter `gem install yeah`.
3. Enter `yeah` to view list of commands.

### Making a game

1. In a command line, enter `yeah new` to generate a new game project.
2. Change into the new project directory, then enter `bundle install`.
3. Add game code to `code/game.rb`. No tutorials yet; please take a look at the [example code](https://github.com/yeahrb/examples) and [API reference](http://rdoc.info/github/yeahrb/yeah/5efbbc9/frames).
4. Enter `yeah serve` and visit [http://localhost:1234](http://localhost:1234) to try the game.


## Links

[0.3.5 API reference](http://rdoc.info/github/yeahrb/yeah/5efbbc9/frames)

[Issue & feature tracker](https://github.com/yeahrb/yeah/issues)

[Discussion via Gitter](https://gitter.im/yeahrb/yeah)

[Author's email](mailto:skoofoo@gmail.com)
