require 'sinatra/base'

class SimpleRackApp < Sinatra::Base
  get '/' do
    'Hello world!'
  end
end
