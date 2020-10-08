# frozen_string_literal: true

require_relative '../../spec_helper'

RSpec.describe SimpleRackApp::Middleware::Logger::CustomLogger do
  let(:app) { ->(_) { [200, {}, ['ok']] } }
  subject { described_class.new(app) }
  let(:log_path) { './log/test.log' }
  let(:time) { DateTime.strptime('2020-10-01 00:00:00', '%F %T').to_time }
  let(:env) do
    {
      'REMOTE_ADDR' => '127.0.0.1',
      'REQUEST_METHOD' => 'GET',
      'PATH_INFO' => '/',
      'CONTENT_LENGTH' => 0
    }
  end
  let(:log_message) { "127.0.0.1 - - [01/Oct/2020:00:00:00 +0000] \"GET / \" 200 0 0.0000\n" }

  before do
    allow(Time).to receive(:now).and_return(time)
  end

  it 'logs request' do
    expect_any_instance_of(::Logger).to receive(:<<).with(log_message)
    subject.call(env)
  end
end
