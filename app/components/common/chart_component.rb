# frozen_string_literal: true

module Common
  class ChartComponent < ViewComponent::Base
    slim_template <<~SLIM
      section data-controller="chart" data-chart-payload-value=(payload)
        canvas data-chart-target="canvas"
    SLIM

    def initialize(payload)
      @payload = payload
    end

    private

    attr_reader :payload
  end
end
