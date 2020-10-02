# frozen_string_literal: true

require 'fileutils'

module SimpleRackApp
  module Middleware
    module Logger
      class FileLogger < Base
        LOG_DIRECTORY = 'log'

        def initialize(app)
          super
          FileUtils.mkdir_p(LOG_DIRECTORY)
        end

        def write(message)
          File.write(log_path, message, mode: 'a')
        end

        private

        def log_path
          @log_path ||= "#{LOG_DIRECTORY}/#{environment}.log"
        end

        def environment
          @environment ||= ENV['RACK_ENV']
        end
      end
    end
  end
end
