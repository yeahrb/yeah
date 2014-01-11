require 'rubygame'

# Desktop window context.
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

  # Size of game window.
  #
  # @return [Vector]
  attr_reader :resolution

  def resolution=(value)
    @screen = Rubygame::Screen.new(value.components[0..1])
    @resolution = value
  end

  # Target ticks per second.
  #
  # @return [Integer
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
  #
  # @param [Symbol|Integer] key or button
  def press(pressable)
    @pressables[pressable] = true
  end

  # Simulate a key or button release.
  #
  # @param [Symbol|Integer] key or button
  def release(pressable)
    @pressables[pressable] = false
  end

  # Renders a stage onto the screen.
  #
  # @param [Stage]
  def render(stage)
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
