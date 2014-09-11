task :default => :test

desc "Run tests through Minitest"
task :test do
  require 'minitest'
  require 'minitest/autorun'

  platform_types = %i[asset display font image keyboard mouse sound ticker]
  platform_type_test_paths = platform_types.map { |t| "test/#{t}_test.rb" }

  Dir.glob('test/{test_helper,*_test}.rb').each do |path|
    require_relative(path) unless platform_type_test_paths.include? path
  end
end

namespace :web do
  require 'opal/minitest/rake_task'

  Opal.append_path('opal')

  Opal::Minitest::RakeTask.new(
    name: 'test',
    requires_glob: 'test/{test_helper,web_test_helper,**/*_test}.{rb,opal}')
end

Dir.glob(File.dirname(__FILE__) + '/tasks/*.rb').each do |file|
  load file
end
