# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruyml/version'

Gem::Specification.new do |spec|
  spec.name          = "ruyml"
  spec.version       = Ruyml::VERSION
  spec.authors       = ["Xavier Lucas"]
  spec.email         = ["xavier_lucas@ymail.com"]

  spec.summary       = %q{Ruby templating from YAML datasources.}
  spec.description   = %q{A command line interface and a library to render erb templates using one or multiple YAML datasources.}
  spec.homepage      = "https://github.com/xlucas/ruyml"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
