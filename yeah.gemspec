# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'yeah/version'

Gem::Specification.new do |s|
  s.name = 'yeah'
  s.version = Yeah::VERSION
  s.summary = "A practical Ruby game framework"
  s.description = "Demolishes the distance from game idea to polished work of art."

  s.authors = ["Artur Ostrega"]
  s.email = 'skoofoo@gmail.com'

  s.files = Dir.glob('{bin,lib,demo}/**/*') + %w(LICENSE.txt README.md)
  s.executables = ['yeah']

  s.homepage = 'https://github.com/skofo/yeah'
  s.license = 'MIT'

  s.add_runtime_dependency 'rubygame', '2.7.0.unofficial'
  s.add_runtime_dependency 'pow', '~> 0.2.2'
  s.add_runtime_dependency 'naught', '~> 0.0.3'
  s.add_development_dependency 'rspec', '~> 2.14.1'
  s.add_development_dependency 'guard-rspec', '~> 3.1.0'
  s.add_development_dependency 'libnotify', '~> 0.8.2'
  s.add_development_dependency 'yard', '~> 0.8.7.2'
end
