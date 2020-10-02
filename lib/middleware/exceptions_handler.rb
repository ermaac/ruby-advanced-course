# frozen_string_literal: true

module SimpleRackApp
  module Middleware
    class ExceptionsHandler
      EXCEPTION_RESPONSE_BODIES = {
        404 => 'SimpleRackApp middleware: Not Found error',
        500 => 'SimpleRackApp middleware: Internal error'
      }.freeze

      def initialize(app)
        @app = app
      end

      def call(env)
        status, headers, body = @app.call(env)
        case status
        when 200..299
          [status, headers, body]
        when 404
          [status, headers, body_for(status: 404)]
        when 500
          [status, headers, body_for(status: 500)]
        end
      end

      private

      def body_for(status:)
        [EXCEPTION_RESPONSE_BODIES[status]] ||
          ["SimpleRackApp middleware: unknown error with status code: #{status}"]
      end
    end
  end
end
