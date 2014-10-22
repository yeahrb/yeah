
require 'benchmark'

namespace :benchmark do
  task :setup do
    ENV['ITERATIONS'] ||= '100000'
  end

  desc 'Benchmark Yeah::Vec2'
  task :vec2 => :setup do |task|
    require 'yeah/vec2'

    def benchmark(job, name, &block)
      iterations = ENV['ITERATIONS'].to_i

      job.report(name) do
        iterations.times do
          yield
        end
      end
    end

    Benchmark.bm(11) do |bm|
      ax, ay, bx, by = 10, 20, -5, -5

      benchmark(bm, :equal?)       { Yeah::Vec2.equal?(ax, ay, bx, by) }
      benchmark(bm, :magnitude)    { Yeah::Vec2.magnitude(ax, ay) }
      benchmark(bm, :direction)    { Yeah::Vec2.direction(ax, ay) }
      benchmark(bm, :add)          { Yeah::Vec2.add(ax, ay, bx, by) }
      benchmark(bm, :subtract)     { Yeah::Vec2.subtract(ax, ay, bx, by) }
      benchmark(bm, :multiply)     { Yeah::Vec2.multiply(ax, ay, bx) }
      benchmark(bm, :divide)       { Yeah::Vec2.divide(ax, ay, bx) }
      benchmark(bm, :multiply)     { Yeah::Vec2.multiply(ax, ay, bx) }
      benchmark(bm, :distance_to)  { Yeah::Vec2.distance_to(ax, ay, bx, by) }
      benchmark(bm, :direction_to) { Yeah::Vec2.direction_to(ax, ay, bx, by) }
    end
  end
end
