# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'swiss_admin/version'

Gem::Specification.new do |spec|
  spec.name          = "swiss_admin"
  spec.version       = SwissAdmin::VERSION
  spec.authors       = ["Bradley Smith"]
  spec.email         = ["bradleydsmith@gmail.com"]
  spec.description   = %q{a set of helpers for any system administrator}
  spec.summary       = %q{a set of helpers for any system administrator}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "rack-test"
  spec.add_dependency "shelltastic"
  spec.add_dependency "sinatra"
  spec.add_dependency "thor"
end
