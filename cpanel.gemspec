lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cpanel/version'

Gem::Specification.new do |spec|
  spec.name = 'cpanel'
  spec.version = Cpanel::VERSION
  spec.homepage = 'https://cpanel.com'
  spec.license = 'MIT'
  spec.description = 'Ruby interface for the Cpanel API'
  spec.summary = 'Ruby interface for the Cpanel API'
  spec.authors = ['C.S.V. Alpha', 'Matthijs Vos']
  spec.email = 'ict@csvalpha.nl'

  spec.files = %w[LICENSE README.md cpanel.gemspec] + Dir['lib/**/*.rb']
  spec.require_paths = %w[lib]

  spec.required_ruby_version = '>= 2.4'
  spec.add_dependency 'rest-client', '~> 2.0'
end
