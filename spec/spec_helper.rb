# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'
require './app'
require 'rspec'
require 'rack/test'

RSpec.configure do
  include Rack::Test::Methods
end
