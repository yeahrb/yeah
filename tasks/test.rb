namespace :test do
  desc "Run tests through Minitest"
  task :common do
    require 'minitest'
    require 'minitest/autorun'

    platform_types = %i[asset display font image keyboard mouse sound ticker]
    platform_type_test_paths = platform_types.map {|t| "../test/#{t}_test.rb" }

    Dir.glob('test/{test_helper,*_test}.rb').each do |path|
      relative_path = "../#{path}"

      unless platform_type_test_paths.include? relative_path
        require_relative(relative_path)
      end
    end
  end

  # Web
  require 'opal/minitest/rake_task'
  Opal.append_path('opal')
  Opal::Minitest::RakeTask.new(
    name: :web,
    requires_glob: 'test/{test_helper,web_test_helper,**/*_test}.{rb,opal}')
end
