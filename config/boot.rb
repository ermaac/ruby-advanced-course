# frozen_string_literal: true

require 'rubygems'
require 'bundler'
Bundler.require
require './simple_rack_app/app'
Dir['./lib/middleware/**/*.rb'].sort.each { |file| require file }
require 'pry' if %w[development test].include?(ENV['RACK_ENV'])
