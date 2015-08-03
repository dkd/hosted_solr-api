# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hosted_solr/api/version'

Gem::Specification.new do |spec|
  spec.name          = 'hosted_solr-api'
  spec.version       = HostedSolr::API::VERSION
  spec.authors       = ['Nicolai Reuschling']
  spec.email         = ['nicolai.reuschling@dkd.de']

  spec.summary       = 'Client for Hosted Solr API'
  spec.description   = 'Allow access to Hosted Solr API.'
  spec.homepage      = "https://github.com/dkd/hosted_solr-api"
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-nc'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'guard-rubocop'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'growl'
  spec.add_development_dependency 'shoulda-matchers'

  spec.add_dependency 'activemodel', '~> 4.2'
  spec.add_dependency 'activesupport', '~> 4.2'
  spec.add_dependency 'active_rest_client'
end
