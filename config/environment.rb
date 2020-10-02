# frozen_string_literal: true

require 'rubygems'
require 'bundler'
Bundler.require
require './simple_rack_app'
require './lib/middleware'
Dir["./lib/middleware/**/*.rb"].each {|file| require file }
