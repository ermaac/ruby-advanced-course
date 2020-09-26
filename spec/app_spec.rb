require_relative './spec_helper'

RSpec.describe SimpleRackApp do
  let(:app) { SimpleRackApp }

  describe 'GET /' do
    it 'returns status code 200 ' do
      get '/'
      expect(last_response.status).to eq(200)
    end
  end

  describe 'page not found' do
    it 'returns status code 404' do
      get '/not-existing-page'
      expect(last_response.status).to eq(404)
    end
  end
end
