# frozen_string_literal: true

module Common
  class KPIProgressComponent < ViewComponent::Base
    def initialize(label:, progress:, max: 100, value: nil)
      @label = label
      @progress = progress
      @max = max
      @value = value || progress
    end

    private

    attr_reader :label, :progress, :max, :value
  end
end
