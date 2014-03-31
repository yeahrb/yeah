module Yeah
module Web

class Context
  include Opal

  def initialize
    @window = Native::Object.new(`window`)

    @screen = Screen.new
    @mouse = Mouse.new(@screen)
  end

  attr_reader :screen

  attr_reader :mouse

  def on_tick(&block)
    @window.requestAnimationFrame do
      yield

      on_tick(&block)
    end
  end
end

end
end
