require 'benchmark'

namespace :benchmark do
  task :setup do
    ENV['ITERATIONS'] ||= '100000'
  end

  desc 'Benchmark Yeah::Vector'
  task :vector => :setup do |task|
    require 'yeah/vector'

    def benchmark(job, name, &block)
      object_sets = Array.new(ENV['ITERATIONS'].to_i) do
        [Yeah::V[10, 20, 30], Yeah::V[-5, -5, -5]]
      end

      job.report(name) do
        object_sets.each { |set| yield set }
      end
    end

    Benchmark.bm(10) do |bm|
      radian = Math::PI * 45 / 180

      benchmark(bm, :+)           { |a, b| a + b }
      benchmark(bm, :-)           { |a, b| a - b }
      benchmark(bm, :*)           { |a, b| a * 5 }
      benchmark(bm, :/)           { |a, b| a / 5 }
      benchmark(bm, :+@)          { |a, b| +a }
      benchmark(bm, :-@)          { |a, b| -a }
      benchmark(bm, :length)      { |a, b| a.length }
      benchmark(bm, :distance_to) { |a, b| a.distance_to b }
      benchmark(bm, :angle_to)    { |a, b| a.angle_to b }
      benchmark(bm, :along)       { |a, b| a.along radian, 10 }
      benchmark(bm, :along!)      { |a, b| a.along! radian, 10 }
      benchmark(bm, :toward)      { |a, b| a.toward b, 10 }
      benchmark(bm, :toward!)     { |a, b| a.toward! b, 10 }
    end
  end
end
