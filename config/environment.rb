# frozen_string_literal: true

require 'rubygems'
require 'bundler'
Bundler.require
require './simple_rack_app/app'
require './lib/middleware'
Dir["./simple_rack_app/**/*.rb"].each { |file| require file }
Dir["./lib/middleware/**/*.rb"].each { |file| require file }
