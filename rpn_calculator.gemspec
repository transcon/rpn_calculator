# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rpn_calculator/version'

Gem::Specification.new do |spec|
  spec.name          = "rpn_calculator"
  spec.version       = RpnCalculator::VERSION
  spec.authors       = ["Chris Moody"]
  spec.email         = ["cmoody@transcon.com"]
  spec.summary       = %q{Simple equation parser with a reverse polish notation calculator as a backend}
  # spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = "https://github.com/transcon/rpn_calculator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'awesome_print'
  spec.add_development_dependency 'minitest-reporters',  '>= 1.0.1'
end
