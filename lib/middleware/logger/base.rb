# frozen_string_literal: true

module SimpleRackApp
  module Middleware
    module Logger
      class Base
        FORMAT = %(%s - %s [%s] "%s %s%s%s %s" %d %s %0.4f\n)

        def initialize(app)
          @app = app
        end

        def call(env)
          began_at = Time.now.utc
          status, headers, body = @app.call(env)
          log(env, status, began_at)
          [status, headers, body]
        end

        private

        def log(env, status, began_at) # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
          request = Rack::Request.new(env)

          message = format(FORMAT,
                           request.ip || '-',
                           env['REMOTE_USER'] || '-',
                           Time.now.strftime('%d/%b/%Y:%H:%M:%S %z'),
                           request.request_method,
                           request.script_name,
                           request.path,
                           request.query_string,
                           env[Rack::SERVER_PROTOCOL],
                           status.to_s[0..3],
                           request.content_length,
                           Time.now.utc - began_at)

          respond_to?(:write) ? write(message) : self << message
        end
      end
    end
  end
end
