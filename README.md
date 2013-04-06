not art
=======
Ruby video game library for pragmatists

Ruby is a good fit for game development for the following reasons:
* Ruby is optimized for developer happiness, and this library is, too. A happy developer is a productive developer, which translates into more games made and with greater passion.
* Ruby has great object-oriented syntax that makes a lot of sense for game constructs.
* Ruby's expressiveness reduces development time and makes it easier to experiment.
* Ruby supports operator overloading, which is very handy for the linear algebra that is typically abundant in game code.
* Software testing is wonderful and ubiquitous in the Ruby community, but the game development community has not embraced it. I hope this library will help change that.
* [Rubygame](https://github.com/rubygame/rubygame/), [Opal](https://github.com/opal/opal), [Ruboto](https://github.com/ruboto/ruboto) and [MobiRuby](https://github.com/mobiruby/mobiruby-ios) would allow for targeting the desktop, web, and mobile using the same codebase.
* The Ruby and game development communities are both particularly artistic as far as software development communities go.

So here's the plan
------------------

### Vector
`Vector` instances represent position, distance, velocity, etc. For the sake of simplicity, all `Vector` instances are three-dimensional and missing components default to 0. As far as I can tell, one can treat a three-dimensional vector with a 0 third component as a two-dimensional vector, so this isn't problematic for 2D game development. `Vector` has method aliases for various synonyms and contexts.

```ruby
Vector[] #=> Vector[0, 0, 0]
v1 = Vector[2, 4, 16] #=> Vector[2, 4, 16]
v1[0] #=> 2
v1.height #=> 4
v1.z #=> 16
v2 = Vector[1.5, 2] * 2 #=> Vector[3, 4, 0]
v2.norm #=> 5
v2.magnitude #=> 5
v2.length #=> 5
v2.distance #=> 5
v2.speed #=> 5
```

### Entity
`Entity` instances are objects that behave in the context of a `Game` instance. Each one has a `Vector` `position`, a `Vector` `size`, and may have a `visual` of various types. `Entity` has an `update` instance method which is continuously called by its `Game` instance, and various other methods. `Entity` is meant to be subclassed.

```ruby
class Paddle < Entity
  def initialize(x: 0, y: 0, game: $game)
    super(x, y, game) # set up position and add self to Game instance
    @visual = Image("gfx/paddle.png")
    @size = @visual.size
    @speed = 5
    @velocity = Vector[]
  end

  def update
    @velocity.reset # same as `@velocity = Vector[0, 0, 0]`

    if press? :left || press? :a # if the left arrow key or A key is pressed...
      @velocity.x -= @speed # increase @velocity to the left
    end
    
    if press? :right || press? :d # if right arrow or D is pressed...
      @velocity.x += @speed # increase @velocity to the right
    end

    if touch? Wall # if next to or intersecting a Wall...
      unintersect Wall # fancy function to unintersect from any Wall
      @velocity.reset # all of our previous button pressing was for naught
    end

    @position += @velocity # move (or perhaps not)
  end
end

p = Paddle.new(20, 30) #=> Paddle at (20, 30, 0) in $game
p.position #=> Vector[20, 30, 0]
p.y #=> 30 # method alias!
```

### Map
Maps are Ruby hashes that can be parsed from JSON. Upon loading a map into a `Game` instance, the game looks for an `entities` key with a value of a hash with keys that correspond to `Entity` subclass names. Each of these keys have a value that is an array of up to 3 numeric elements or an array of said arrays. These numeric arrays represent coordinates at which to instantiate said `Entity` subclasses. Maps can also contain arbitrary data.

```ruby
level4 = {
  entities: {
    Teal: [10, 10], # instantiate Entity subclass Teal at (10, 10, 0)
    Behemoth: [ # instantiate Behemoth at three different coordinates
      [50, 10],
      [100, 10],
      [150, 10]
    ]
  },
  name: "Level 4", # arbitrary data
  time_limit: 300 # this too
}
```

### Game
...
