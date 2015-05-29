# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'yeah/version'

Gem::Specification.new do |s|
  s.name = 'yeah'
  s.version = Yeah::VERSION
  s.summary = "Ruby video game framework"

  s.author = "Artur Ostręga"
  s.email = 'artur.mariusz.ostrega@gmail.com'

  s.files = Dir.glob('{bin,lib,opal}/**/*') +
            %w(LICENSE.txt CHANGELOG.md UPGRADING.md README.md)
  s.executables = ['yeah']

  s.homepage = 'https://github.com/yeahrb/yeah'
  s.license = 'MIT'

  s.add_runtime_dependency 'opal', '~> 0.7.2'

  s.add_development_dependency 'rake', '~> 10.3.2'
  s.add_development_dependency 'minitest', '~> 5.3.5'
  s.add_development_dependency 'opal-minitest', '~> 0.0.4'
  s.add_development_dependency 'yard', '~> 0.8.7.6'
  s.add_development_dependency 'kramdown', '~> 1.4.2'
end
