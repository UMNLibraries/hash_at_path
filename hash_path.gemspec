# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hash_path/version'

Gem::Specification.new do |spec|
  spec.name          = "hash_path"
  spec.version       = HashPath::VERSION
  spec.authors       = ["chadfennell"]
  spec.email         = ["libsys@gmail.com"]

  spec.summary       = %q{Extends Hash with xpath like syntax for retrieving hash values.}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1.0"
end
