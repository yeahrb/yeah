# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'yeah/version'

Gem::Specification.new do |s|
  s.name = 'yeah'
  s.version = Yeah::VERSION
  s.summary = "Ruby video game framework"

  s.author = "Artur M. Ostręga"
  s.email = 'artur.mariusz.ostrega@gmail.com'

  s.files = Dir.glob('{bin,lib}/**/*') +
            %w(LICENSE.txt CHANGELOG.md UPGRADING.md README.md)
  s.executables = ['yeah']

  s.homepage = 'https://github.com/yeahrb/yeah'
  s.license = 'MIT'

  s.add_runtime_dependency 'yeah-web', '~> 0.5.0.dev'
end
