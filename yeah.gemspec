# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'yeah'

Gem::Specification.new do |s|
  s.name = 'yeah'
  s.version = Yeah::VERSION
  s.summary = "The positive video game framework"
  s.description = "Programming video games should have a positive impact on your health!"
  s.authors = ["Artur Ostrega"]
  s.email = 'skoofoo@gmail.com'
  s.files = Dir.glob('lib/**/*') + %w(LICENSE.txt README.md CHANGELOG.md)
  s.license = 'MIT'
  s.homepage = 'https://github.com/skofo/yeah'
  s.add_runtime_dependency 'rubygame'
  s.add_runtime_dependency 'pow'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'yard'
end
