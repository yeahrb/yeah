require 'benchmark'

namespace :benchmark do
  task :setup do
    ENV['ITERATIONS'] ||= '100000'
  end

  desc 'Benchmark Yeah::Vector'
  task :vector => :setup do |task|
    require 'yeah/vector'
    Benchmark.bm(10) do |bm|
      iterations = ENV['ITERATIONS'].to_i

      a = Yeah::Vector.new(10, 20, 30)
      b = Yeah::Vector.new(-5, -5, -5)

      bm.report('+') do
        iterations.times { |i| a + b }
      end

      bm.report('-') do
        iterations.times { |i| a - b }
      end

      bm.report('*') do
        iterations.times { |i| a * 5 }
      end

      bm.report('/') do
        iterations.times { |i| a / 5 }
      end

      bm.report('+@') do
        iterations.times { |i| +a }
      end

      bm.report('-@') do
        iterations.times { |i| -a }
      end

      bm.report('length') do
        iterations.times { |i| a.length }
      end

      bm.report('distance_to') do
        iterations.times { |i| a.distance_to(b) }
      end

      bm.report('angle_to') do
        iterations.times { |i| a.angle_to(b) }
      end

      radian = Math::PI * 45 / 180
      bm.report('along') do
        iterations.times { |i| a.along(radian, 10) }
      end

      bm.report('along!') do
        iterations.times { |i| a.along!(radian, 10) }
      end
    end
  end
end
