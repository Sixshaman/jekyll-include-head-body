# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-include-head/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-include-head"
  spec.version       = Jekyll::IncludeHead::VERSION
  spec.authors       = ["Dommmel"]
  spec.email         = ["dommmel@gmail.com"]

  spec.summary       = %q{jekyll plugin to include the <head> of another HTML document}
  spec.description   = %q{jekyll plugin to include the <head> of another HTML document}
  spec.homepage      = "https://github.com/Sixshaman/jekyll-include-head"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'jekyll'
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
