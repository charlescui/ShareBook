# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'share_book/version'

Gem::Specification.new do |spec|
  spec.name          = "share_book"
  spec.version       = ShareBook::VERSION
  spec.authors       = ["zheng.cuizh"]
  spec.email         = ["zheng.cuizh@gmail.com"]
  spec.description   = %q{this is a bookstore for shared and for reading on app}
  spec.summary       = %q{this is a bookstore for shared and for reading on app}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "data_mapper"
  spec.add_development_dependency "dm-sqlite-adapter"
  spec.add_development_dependency "json"
  spec.add_development_dependency "byebug"
end
