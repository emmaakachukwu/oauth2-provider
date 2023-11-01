require 'rubygems'
require 'bundler/setup'

require 'active_record'
require 'oauth2/provider'
OAuth2::Provider.realm = 'Notes App'

dir = File.expand_path('..', __FILE__)
require dir + '/models/connection'
require dir + '/models/user'
require dir + '/models/note'
