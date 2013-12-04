# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'yeah'

Gem::Specification.new do |s|
  s.name = 'yeah'
  s.version = Yeah::VERSION
  s.summary = "A practical Ruby game framework"
  s.description = "Demolishes the distance from game idea to polished work of art."
  s.authors = ["Artur Ostrega"]
  s.email = 'skoofoo@gmail.com'
  s.files = Dir.glob('{bin,lib,demo}/**/*') + %w(LICENSE.txt README.md)
  s.license = 'MIT'
  s.homepage = 'https://github.com/skofo/yeah'
  s.executables = ['yeah']
  s.add_runtime_dependency 'rubygame'
  s.add_runtime_dependency 'pow'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'yard'
end
