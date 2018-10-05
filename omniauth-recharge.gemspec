# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/recharge/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-recharge"
  spec.version       = OmniAuth::Recharge::VERSION
  spec.authors       = ["Mike Machado", "Paul Robertson"]
  spec.email         = ["mike@leaddyno.com", "t.paulrobertson@gmail.com"]

  spec.summary       = %q{ReCharge strategy for OmniAuth.}
  spec.homepage      = "https://github.com/ReChargePayments/omniauth-recharge"
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.2'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
