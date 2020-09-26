ENV['RACK_ENV'] = 'test'
require './app.rb'
require 'rspec'
require 'rack/test'

RSpec.configure do |config|
  include Rack::Test::Methods
end
