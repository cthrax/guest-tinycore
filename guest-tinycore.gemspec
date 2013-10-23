# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tinycore/version'

Gem::Specification.new do |spec|
  spec.name          = "guest-tinycore"
  spec.version       = VagrantPlugins::GuestTinyCore::VERSION
  spec.authors       = ["Myles Bostwick"]
  spec.email         = ["mbostwick@in-situ.com"]
  spec.description   = "Vagrant plugin for the TinyCore guest OS."
  spec.summary       = "Vagrant plugin for the TinyCore guest OS."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end