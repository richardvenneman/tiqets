# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tiqets/version'

Gem::Specification.new do |spec|
  spec.name          = 'tiqets'
  spec.version       = Tiqets::VERSION
  spec.authors       = ['Richard Venneman']
  spec.email         = ['richardvenneman@me.com']

  spec.summary       = 'Ruby Tiqets API wrapper'
  spec.description   = 'Ruby Tiqets API wrapper.'
  spec.homepage      = 'https://github.com/richardvenneman/tiqets'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'http', '~> 2'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'guard', '~> 2'
  spec.add_development_dependency 'guard-minitest', '~> 2'
  spec.add_development_dependency 'rake', '~> 10.0'
end
