# frozen_string_literal: true

module SimpleRackApp
  module Middleware
    class ExceptionsHandler
      def initialize(app)
        @app = app
      end

      def call(env)
        status, headers, body = @app.call(env)
        case status
        when 200..299
          [status, headers, body]
        when 404
          [status, headers, [content_for(status: 404)]]
        when 500
          [status, headers, [content_for(status: 500)]]
        end
      end

      private

      def content_for(status:)
        file_name = "./public/#{status}.html"
        return File.read(file_name) if File.exists?(file_name)

        "SimpleRackApp middleware: unknown error with status code: #{status}"
      end
    end
  end
end
