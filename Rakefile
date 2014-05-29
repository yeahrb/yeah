task :default => :test

task :test do
  require 'yeah'
  require 'minitest/autorun'
  require 'minitest/unit'

  include MiniTest

  Dir.glob('test/**/*_test.rb').each { |f| require_relative f }
end
