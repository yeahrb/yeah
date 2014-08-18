# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'yeah/version'

Gem::Specification.new do |s|
  s.name = 'yeah'
  s.version = Yeah::VERSION
  s.summary = "Practical Ruby video game framework"
  s.description = "Video game framework designed to be easy to learn and " +
                  "fast to build games with."

  s.authors = ["Artur Ostrega"]
  s.email = 'skoofoo@gmail.com'

  s.files = Dir.glob('{bin,lib,opal,examples}/**/*') + %w(LICENSE.txt README.md)
  s.executables = ['yeah']

  s.homepage = 'https://github.com/skofo/yeah'
  s.license = 'MIT'

  s.add_runtime_dependency 'opal', '~> 0.7.0.dev'
  s.add_development_dependency 'rake', '~> 10.3.1'
  s.add_development_dependency 'minitest', '~> 5.3.2'
  s.add_development_dependency 'opal-minitest', '~> 0.0.3'
  s.add_development_dependency 'yard', '~> 0.8.7.2'
  s.add_development_dependency 'kramdown', '~> 1.4.1'
end
