# frozen_string_literal: true

require './config/environment'

use SimpleRackApp::Middleware::Logger::FileLogger

run SimpleRackApp::App.new
