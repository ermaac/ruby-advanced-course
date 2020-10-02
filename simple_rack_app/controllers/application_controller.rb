# frozen_string_literal: true

module SimpleRackApp
  class ApplicationController
    attr_reader :name, :action
    attr_accessor :status, :headers, :content

    def initialize(name: nil, action: nil)
      @name = name
      @action = action
    end

    def call
      send(action)
      self.status = 200
      self.headers = { 'Content-Type' => 'text/plain' }
      self.content ||= ['Simple Rack App']
      self
    end

    def not_found
      self.status = 404
      self.headers = {}
      self.content = ['Not Found error']
      self
    end

    def internal_error
      self.status = 500
      self.headers = {}
      self.content = ['Internal error']
      self
    end
  end
end
