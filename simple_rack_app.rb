# frozen_string_literal: true

class SimpleRackApp
  def call(_env)
    [200, {}, ['Hello world']]
  end
end
