# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe SimpleRackApp::Middleware::StaticContentHandler do
  let(:app) do
    Rack::Builder.new do
      use SimpleRackApp::Middleware::StaticContentHandler
      run SimpleRackApp::App.new
    end
  end

  describe 'about page' do
    context 'when extension is specified' do
      context 'and matches' do
        before do
          expect_any_instance_of(SimpleRackApp::Router).not_to receive(:resolve).and_call_original
        end

        it 'returns static page' do
          get '/about.html'
          expect(last_response.status).to eq(200)
        end
      end

      context 'and doesn\'t match' do
        before do
          expect_any_instance_of(SimpleRackApp::Router).to receive(:resolve).and_call_original
        end

        it 'returns response with 404 error' do
          get '/about.txt'
          expect(last_response.status).to eq(404)
        end
      end
    end

    context 'when extension is not specified' do
      before do
        expect_any_instance_of(SimpleRackApp::Router).not_to receive(:resolve).and_call_original
      end

      it 'returns static page' do
        get '/about'
        expect(last_response.status).to eq(200)
      end
    end
  end
end
