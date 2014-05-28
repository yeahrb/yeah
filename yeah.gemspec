# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'yeah/version'

Gem::Specification.new do |s|
  s.name = 'yeah'
  s.version = Yeah::VERSION
  s.summary = "Practical Ruby video game framework"
  s.description = "Video game framework that takes advantage of Ruby's " +
    "unique set of strengths as a programming language."

  s.authors = ["Artur Ostrega"]
  s.email = 'skoofoo@gmail.com'

  s.files = Dir.glob('{bin,lib,demo}/**/*') + %w(LICENSE.txt README.md)
  s.executables = ['yeah']

  s.homepage = 'https://github.com/skofo/yeah'
  s.license = 'MIT'

  s.add_runtime_dependency 'opal', '~> 0.6.2'
  s.add_development_dependency 'rspec', '~> 2.14.1'
  s.add_development_dependency 'guard-rspec', '~> 3.1.0'
  s.add_development_dependency 'libnotify', '~> 0.8.2'
  s.add_development_dependency 'yard', '~> 0.8.7.2'
end
