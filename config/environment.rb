require "bundler/setup"
require 'active_record'

Bundler.require

require 'rake'
require 'yaml'

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../app/api_callers", "*.rb")].each {|f| require f}

connection_details = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection(connection_details)

RAKE_APP ||= Rake.application
