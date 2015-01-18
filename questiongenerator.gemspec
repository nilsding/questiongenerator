# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'questiongenerator'

Gem::Specification.new do |spec|
  spec.name          = "questiongenerator"
  spec.version       = QuestionGenerator::VERSION
  spec.authors       = ["nilsding"]
  spec.email         = ["nilsding@nilsding.org"]
  spec.summary       = %q{A simple question generator.}
  spec.description   = %q{A simple question generator, used by Retrospring.}
  spec.homepage      = "https://github.com/retrospring/questiongenerator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
