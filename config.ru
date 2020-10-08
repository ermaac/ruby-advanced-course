# frozen_string_literal: true

require './config/boot'

use SimpleRackApp::Middleware::Logger::CustomLogger
use SimpleRackApp::Middleware::StaticContentHandler
use SimpleRackApp::Middleware::ExceptionsHandler

run SimpleRackApp::App.new
