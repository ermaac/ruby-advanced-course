# frozen_string_literal: true

module SimpleRackApp
  class Router
    attr_reader :routes

    def initialize(routes)
      @routes = routes
    end

    def resolve(env)
      path = env['PATH_INFO']
      if routes.key?(path)
        ctrl(routes[path]).call
      else
        ApplicationController.new.not_found
      end
    rescue Exception => error
      ApplicationController.new.internal_error
    end

    private

    def ctrl(string)
      ctrl_name, action_name = string.split('#')
      klass = SimpleRackApp.const_get "#{ctrl_name.capitalize}Controller"
      klass.new(name: ctrl_name, action: action_name.to_sym)
    end
  end
end
