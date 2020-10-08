# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'
require './config/boot'
require 'rspec'
require 'rack/test'

RSpec.configure do |config|
  include Rack::Test::Methods

  shared_context('global helpers') do
    let(:app) { SimpleRackApp::App.new }
  end

  config.include_context('global helpers')
end
