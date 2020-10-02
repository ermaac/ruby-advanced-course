# frozen_string_literal: true

require_relative '../../spec_helper'

RSpec.describe SimpleRackApp::Middleware::Logger::FileLogger do
  let(:log_path) { './log/test.log' }
  let(:time) { DateTime.strptime("2020-10-01 00:00:00", "%F %T").to_time }

  before do
    allow(Time).to receive(:now).and_return(time)
    File.delete(log_path) if File.exists?(log_path)
  end

  describe '#write' do
    it 'writes log message to file' do
      expect(File).to receive(:write).and_call_original
      get '/'
      logs = File.readlines(log_path)
      expect(logs).to include("127.0.0.1 - - [01/Oct/2020:00:00:00 +0000] \"GET / \" 200 - 0.0000\n")
    end
  end
end
