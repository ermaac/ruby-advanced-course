# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe SimpleRackApp::Middleware::ExceptionsHandler do
  subject { described_class.new(app) }

  before do
    @status_code, _, body = subject.call({})
    @body = body.first
  end

  describe '404 error' do
    let(:app) { ->(_) { [404, {}, ['not found']] } }

    it 'returns response modified by middleware' do
      expect(@status_code).to eq(404)
      expect(@body).to match('SimpleRackApp middleware')
      expect(@body).to match('Not Found error')
    end
  end

  describe '500 error' do
    let(:app) { ->(_) { [500, {}, ['internal error']] } }

    it 'returns response modified by middleware' do
      expect(@status_code).to eq(500)
      expect(@body).to match('SimpleRackApp middleware')
      expect(@body).to match('Internal error')
    end
  end
end
