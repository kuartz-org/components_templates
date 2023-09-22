# frozen_string_literal: true

module Common
  class ChartComponent < ViewComponent::Base
    def initialize(payload:, title: "")
      @payload = payload
      @title = title
    end

    private

    attr_reader :payload, :title
  end
end
