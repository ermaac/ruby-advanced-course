# frozen_string_literal: true

module SimpleRackApp
  class App
    def call(_env)
      [200, {}, ['Hello world']]
    end
  end
end
