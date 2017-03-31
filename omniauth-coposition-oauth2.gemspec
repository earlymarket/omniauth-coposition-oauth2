# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/coposition/oauth2/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-coposition-oauth2"
  spec.version       = Omniauth::CopositionOauth2::VERSION
  spec.authors       = ["Dmitry Trager"]
  spec.email         = ["dmitry.trager@flatstack.com"]

  spec.summary       = %q{A Coposition OAuth2 strategy for OmniAuth 1.x}
  spec.description   = %q{A Coposition OAuth2 strategy for OmniAuth 1.x}
  spec.homepage      = "https://github.com/earlymarket/omniauth-coposition-oauth2"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth', '>= 1.1.1'
  spec.add_runtime_dependency 'omniauth-oauth2', '>= 1.3.1'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
