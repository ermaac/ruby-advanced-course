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
          log(env, status, headers, began_at)
          [status, headers, body]
        end

        private

        def log(env, status, header, began_at) # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
          length = extract_content_length(header)

          message = format(FORMAT,
                           env['HTTP_X_FORWARDED_FOR'] || env['REMOTE_ADDR'] || '-',
                           env['REMOTE_USER'] || '-',
                           Time.now.strftime('%d/%b/%Y:%H:%M:%S %z'),
                           env[REQUEST_METHOD],
                           env[SCRIPT_NAME],
                           env[PATH_INFO],
                           env[QUERY_STRING].empty? ? '' : "?#{env[QUERY_STRING]}",
                           env[SERVER_PROTOCOL],
                           status.to_s[0..3],
                           length,
                           Time.now.utc - began_at)

          respond_to?(:write) ? write(message) : self << message
        end

        def extract_content_length(headers)
          value = headers[CONTENT_LENGTH]
          !value || value.to_s == '0' ? '-' : value
        end
      end
    end
  end
end
