# Yeah

Practical Ruby video game framework, alpha stage


## Features

* Designed to be easy to learn and fast to build games with
* Embraces Ruby's strengths (object-orientation, duck typing, focus on developer happiness)
* Platform-agnostic (currently compiles to web pages; PC executables and mobile apps planned)
* Convention (over configuration)-oriented
* Processing/HTML5 Canvas-style drawing API
* Command-line utilities (no monolithic IDE)
* Open source under MIT license


## Early examples

* Random [\[play\]](https://skofo.github.io/yeah/examples/random/runner.html) [\[code\]](https://github.com/skofo/yeah/tree/examples/examples/random)
* Asteroids [\[play\]](https://skofo.github.io/yeah/examples/asteroids/runner.html) [\[code\]](https://github.com/skofo/yeah/tree/examples/examples/asteroids)


## Usage

NOTE: This is alpha-stage software, expect changes!

### Installation

1. Install Ruby 2.0+, visit [the Ruby website](http://ruby-lang.org/) for more info.
2. In a command line, enter `gem install yeah`.
3. Enter `yeah` to view list of commands.

### Making a game

1. In a command line, enter `yeah new` to generate a new game project.
2. Change into the new `game` directory, then enter `bundle install`.
3. Add game code to `code/game.rb`. No tutorials yet; please take a look at the [example code](https://github.com/skofo/yeah/tree/examples/examples) and [API reference](http://rdoc.info/github/yeahrb/yeah/master/frames).
4. Enter `yeah serve` and visit [http://localhost:1234](http://localhost:1234) to try the game.

View the [API reference](http://rdoc.info/github/yeahrb/yeah/master/frames) for more information.
