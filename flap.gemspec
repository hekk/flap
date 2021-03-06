# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flap/version'

Gem::Specification.new do |spec|
  spec.name          = "flap"
  spec.version       = Flap::VERSION
  spec.authors       = ["Tomohiro Nishimura"]
  spec.email         = ["tomohiro68@gmail.com"]
  spec.summary       = %q{tap + instance_eval}
  spec.description   = %q{tap + instance_eval}
  spec.homepage      = "https://github.com/hekk/flap"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
