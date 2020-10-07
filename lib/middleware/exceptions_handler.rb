# frozen_string_literal: true

module SimpleRackApp
  module Middleware
    class ExceptionsHandler
      def initialize(app)
        @app = app
      end

      def call(env)
        status, headers, = response = @app.call(env)
        return response unless [404, 500].include?(status)

        [status, headers, [content_for(status: status)]]
      end

      private

      def content_for(status:)
        file_name = "./public/#{status}.html"
        return File.read(file_name) if File.exist?(file_name)

        "SimpleRackApp middleware: unknown error with status code: #{status}"
      end
    end
  end
end
