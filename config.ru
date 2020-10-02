# frozen_string_literal: true

require './config/environment'

use SimpleRackApp::Middleware::Logger::FileLogger
use SimpleRackApp::Middleware::StaticContentHandler
use SimpleRackApp::Middleware::ExceptionsHandler

run SimpleRackApp::App.new
