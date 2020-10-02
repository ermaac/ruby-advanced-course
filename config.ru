# frozen_string_literal: true

require 'rubygems'
require 'bundler'
Bundler.require
require_relative './simple_rack_app'

run SimpleRackApp::App.new
