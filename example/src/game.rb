class ExampleGame < Yeah::Game
  def initialize
    super

    puts "Hello!"
    display.size = 320, 240
  end
end
