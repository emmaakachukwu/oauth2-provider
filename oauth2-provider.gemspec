lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'oauth2/version'

Gem::Specification.new do |s|
  s.name              = 'oauth2-provider'
  s.version           = OAuth2::VERSION
  s.summary           = 'Simple OAuth 2.0 provider toolkit'
  s.author            = 'Consumer team'
  s.email             = 'devs@avvo.com'
  s.homepage          = 'https://git.internetbrands.com/avvo-libraries/oauth2-provider'

  s.extra_rdoc_files  = %w[README.rdoc]
  s.rdoc_options      = %w[--main README.rdoc]

  s.metadata['allowed_push_host'] = 'https://artifactory.internetbrands.com/artifactory/api/gems/avvo-ruby-local'

  s.files             = %w[History.txt README.rdoc] + Dir.glob('{example,lib,spec}/**/*.{css,erb,rb,rdoc,ru}')
  s.require_paths     = ['lib']

  s.add_dependency 'activerecord'
  s.add_dependency 'bcrypt'
  s.add_dependency 'json'
  s.add_dependency 'rack'

  s.add_development_dependency 'appraisal', '~> 0.4.0'
  s.add_development_dependency 'factory_girl', '~> 2.0'
  s.add_development_dependency 'i18n', '~> 0.6.4'
  s.add_development_dependency 'mysql', '~> 2.8.0' if ENV['DB'] == 'mysql' # version locked by ActiveRecord
  s.add_development_dependency 'pg', '~> 0.18.4' if ENV['DB'] == 'postgres'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'sinatra', '~> 1.3'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'thin'
end
