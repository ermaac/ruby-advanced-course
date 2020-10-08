# frozen_string_literal: true

require_relative './spec_helper'

RSpec.describe SimpleRackApp::App do
  describe 'GET /' do
    it 'returns status code 200 ' do
      get '/'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq('Hello world')
    end
  end
end
