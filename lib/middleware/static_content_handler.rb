# frozen_string_literal: true

module SimpleRackApp
  module Middleware
    class StaticContentHandler
      def initialize(app)
        @app = app
      end

      def call(env)
        file_path = static_content_file_path(env)
        return static_content(file_path) if file_path

        @app.call(env)
      end

      private

      def static_content_file_path(env)
        resource_name = File.basename(env['PATH_INFO'])
        sanitized_resource_name = sanitize(resource_name)
        find_file(sanitized_resource_name)
      end

      def find_file(sanitized_resource_name)
        Dir['./public/*'].find { |f| f.match?(sanitized_resource_name) }
      end

      def sanitize(file_name)
        file_name.gsub('./', '').gsub('../', '')
      end

      def static_content(resource_path)
        content = File.read(resource_path)
        [200, {}, [content]]
      end
    end
  end
end
