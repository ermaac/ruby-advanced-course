# frozen_string_literal: true

require 'logger'

module SimpleRackApp
  module Middleware
    module Logger
      class CustomLogger < Base
        attr_reader :logger

        def initialize(app, level = ::Logger::INFO)
          super(app)
          @logger = ::Logger.new($stdout)
          @logger.level = level
        end

        def write(message)
          logger << message
        end
      end
    end
  end
end
