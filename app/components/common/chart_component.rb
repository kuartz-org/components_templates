# frozen_string_literal: true

module Common
  class ChartComponent < ViewComponent::Base
    def initialize(payload)
      @payload = payload
    end

    private

    attr_reader :payload
  end
end
