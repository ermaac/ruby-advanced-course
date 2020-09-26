# frozen_string_literal: true

require 'sinatra/base'

class SimpleRackApp < Sinatra::Base
  get '/' do
    'Hello world!'
  end
end
