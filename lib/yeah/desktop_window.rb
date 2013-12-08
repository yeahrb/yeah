require 'rubygame'

# Desktop window context powered by Rubygame.
class Yeah::DesktopWindow
  include Yeah

  def initialize(resolution=V[320, 180])
    self.resolution = resolution

    @clock = Rubygame::Clock.new
    self.tickrate = 30

    @pressables = {}
    pressables_keys = [(:a..:z).to_a, (:A..:Z).to_a, (0..9).to_a,
                       :up, :down, :left, :right].flatten
    pressables_keys.each { |pk| @pressables[pk] = false }
  end

  # @return [Rubygame::Screen]
  attr_reader :screen

  # @return [Vector] size of game window
  attr_reader :resolution

  def resolution=(value)
    @screen = Rubygame::Screen.new(value.components[0..1])
    @resolution = value
  end

  # @return [Integer] target ticks per second
  attr_reader :tickrate

  def tickrate=(value)
    @clock.target_framerate = value
    @tickrate = value
  end

  # Is a key or button being pressed?
  # @param [Symbol|Integer] key or button
  def pressing?(*pressables)
    raise ArgumentError if pressables.empty?
    pressables.any? { |p| @pressables[p] }
  end

  # Simulate a key or button press.
  # @param [Symbol|Integer] key or button
  def press(pressable)
    @pressables[pressable] = true
  end

  # Simulate a key or button release.
  # @param [Symbol|Integer] key or button
  def release(pressable)
    @pressables[pressable] = false
  end

  # Project a surface onto the screen.
  # @param [Surface]
  def render(surface)
    masks = [0x0000ff,  0x00ff00,  0xff0000, 0]

    if surface && surface.size != V[]
      rg_surface = Rubygame::Surface.new(surface.size.to_a[0..1], masks: masks)
      rg_surface.pixels = surface.data
      rg_surface.blit(screen, [0, 0])
    end

    screen.update
  end

  # Execute passed block on each tick.
  # @yield
  def each_tick
    loop do
      yield
      @clock.tick
    end
  end
end
