# frozen_string_literal: true

module SimpleRackApp
  class MainController < ApplicationController
    def index
      self.content = ['Hello world']
    end
  end
end
