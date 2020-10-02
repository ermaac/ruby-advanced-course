# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'
require './config/environment'
require 'rspec'
require 'rack/test'

RSpec.configure do |config|
  include Rack::Test::Methods

  shared_context('global helpers') do
    let(:app) do
      Rack::Builder.new do
        eval File.read('./config.ru')
      end
    end
  end

  config.include_context('global helpers')
end
