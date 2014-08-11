task :default => :test

task :test do
  require 'minitest'
  require 'minitest/autorun'

  Dir.glob('test/{test_helper,*_test}.rb').each { |f| require_relative(f) }
end

namespace :web do
  require 'opal/minitest/rake_task'
  Opal.append_path('opal')
  Opal::Minitest::RakeTask.new(:test)

  task :server do
    require 'yeah/web/server'

    Yeah::Web::Server.new.start
  end
end
