# frozen_string_literal: true

require 'yaml'
require_relative './router'

module SimpleRackApp
  class App
    attr_reader :router

    def initialize
      @router = Router.new(routes)
    end

    def call(env)
      result = router.resolve(env)
      [result.status, result.headers, result.content]
    end

    private

    def routes
      @routes ||= YAML.load_file('./config/routes.yml')
    end
  end
end
