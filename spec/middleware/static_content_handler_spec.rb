# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe SimpleRackApp::Middleware::StaticContentHandler do
  let(:app) { ->(_) { [404, {}, ['not found']] } }
  subject { described_class.new(app) }
  let(:env) { { 'PATH_INFO' => request_path } }
  before do
    @status_code, _, body = subject.call(env)
    @body = body.first
  end

  describe 'about page' do
    context 'when extension is specified' do
      context 'and matches' do
        let(:request_path) { '/about.html' }

        it 'returns static page' do
          expect(@status_code).to eq(200)
          expect(@body).to match('About page')
        end
      end

      context 'and doesn\'t match' do
        let(:request_path) { '/about.txt' }

        it 'returns response with 404 error' do
          expect(@status_code).to eq(404)
        end
      end
    end

    context 'when extension is not specified' do
      let(:request_path) { '/about' }

      it 'returns static page' do
        expect(@status_code).to eq(200)
        expect(@body).to match('About page')
      end
    end
  end
end
