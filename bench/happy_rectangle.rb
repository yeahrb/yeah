#!/usr/bin/env ruby

# Happy Rectangle
# A barebones benchmark for Yeah.

lib = File.expand_path('../../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'benchmark'
require 'yeah'
include Yeah

class HappyRectangle < Entity
  def initialize(position)
    super position
    @visual = Rectangle.new(Vector[16, 24], Color[255, 255, 0, 255])
    @updates = 0
    @radius = 60
    @center = (Game.new.resolution - @visual.size) / 2
  end

  def update
    @updates += 1
    @position.x = @center.x + (Math.cos(@updates) * @radius).floor
    @position.y = @center.y + (Math.sin(@updates) * @radius).floor
  end
end

class HappyRectangleGame < Game
  def initialize
    super
    @updates = 0
    @last_update = 30
    @entities << HappyRectangle.new(resolution/2)
  end

  def update
    super
    @updates += 1
    puts "#{@updates}/#{@last_update} updates."
    stop if @updates == @last_update
  end
end

Benchmark.bmbm do |bm|
  bm.report do
    HappyRectangleGame.new.start
  end
end
