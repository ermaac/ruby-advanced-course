# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe SimpleRackApp::Middleware::ExceptionsHandler do
  context 'with middleware' do
    let(:app) do
      Rack::Builder.new do
        use SimpleRackApp::Middleware::ExceptionsHandler
        run SimpleRackApp::App.new
      end
    end

    describe '404 error' do
      it 'returns response modified by middleware' do
        get '/unknown-route'
        expect(last_response.status).to eq(404)
        expect(last_response.body).to match('SimpleRackApp middleware')
        expect(last_response.body).to match('Not Found error')
      end
    end

    describe '500 error' do
      before do
        allow_any_instance_of(SimpleRackApp::ApplicationController).to receive(:call).and_raise(StandardError)
      end
      it 'returns response modified by middleware' do
        get '/'
        expect(last_response.status).to eq(500)
        expect(last_response.body).to match('SimpleRackApp middleware')
        expect(last_response.body).to match('Internal error')
      end
    end
  end

  context 'without middleware' do
    describe '404 error' do
      it 'returns response modified by middleware' do
        get '/unknown-route'
        expect(last_response.status).to eq(404)
        expect(last_response.body).to eq('Not Found error')
      end
    end

    describe '500 error' do
      before do
        allow_any_instance_of(SimpleRackApp::ApplicationController).to receive(:call).and_raise(StandardError)
      end
      it 'returns response modified by middleware' do
        get '/'
        expect(last_response.status).to eq(500)
        expect(last_response.body).to eq('Internal error')
      end
    end
  end
end
