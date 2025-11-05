lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cpanel/version'

Gem::Specification.new do |spec|
  spec.name = 'cpanel-email'
  spec.version = CpanelEmail::VERSION
  spec.homepage = 'https://github.com/your-org/cpanel-email'
  spec.license = 'MIT'
  spec.description = 'Ruby interface for the cPanel API to manage email forwarders and accounts.'
  spec.summary = 'Ruby interface for the cPanel API to manage email forwarders and accounts.'
  spec.authors = ['C.S.V. Alpha', 'Jorai Geertsema']
  spec.email = 'ict@csvalpha.nl'
  spec.files = %w[LICENSE README.md cpanel-email.gemspec] + Dir['lib/**/*.rb']
  spec.require_paths = %w[lib]

  spec.required_ruby_version = '>= 3.2'
  spec.add_dependency 'rest-client', '~> 1.0'
end

Gem::Specification.new do |spec|
  spec.name = 'cpanel'
  spec.version = Cpanel::VERSION
  spec.homepage = 'https://cpanel.com'
  spec.license = 'MIT'
  spec.description = 'Ruby interface for the Cpanel API'
  spec.summary = 'Ruby interface for the Cpanel API'
  spec.authors = ['C.S.V. Alpha', 'Jorai Geertsema']
  spec.email = 'ict@csvalpha.nl'

  spec.files = %w[LICENSE README.md cpanel.gemspec] + Dir['lib/**/*.rb']
  spec.require_paths = %w[lib]

  spec.required_ruby_version = '>= 3.2'
  spec.add_dependency 'rest-client', '~> 1.0'
end