task :default => :test

task :test do
  require 'yeah'
  require 'minitest/autorun'
  require 'minitest/unit'

  include MiniTest

  Dir.glob('test/**/*_test.rb').each { |f| require_relative(f) }
end

namespace :web do
  task :test do
    require 'pathname'
    require 'erb'
    require 'rack'
    require 'opal'

    WEB_TEST_PATH = Pathname.new('test/platforms/web')

    class Server
      def initialize
        Rack::Server.start(app: app)
      end

      def app
        @app ||= Rack::Builder.new do
          assets = Assets.new

          map('/assets') { run assets }
          map('/')       { run Index.new(assets) }
        end
      end

      class Index
        attr_reader :assets, :tests

        def initialize(assets)
          @assets = assets

          Dir.chdir('test/platforms/web')
          @tests = Dir['**/*.js'].reject { |p| p[/runner\/.*/] }
          Dir.chdir('../../..')
        end

        def call(env)
          [200, { 'Content-Type' => 'text/html' }, [content]]
        end

        def content
          @content ||= ERB.new(
            File.read(WEB_TEST_PATH.join('runner', 'index.html.erb'))
          ).result(binding)
        end
      end

      class Assets < Opal::Environment
        def initialize
          super

          use_gem 'opal'
          append_path 'lib'
          append_path WEB_TEST_PATH
          append_path WEB_TEST_PATH.join('runner', 'assets')
          $LOAD_PATH.each { |p| append_path(p) }
        end
      end
    end

    Server.new
  end
end
