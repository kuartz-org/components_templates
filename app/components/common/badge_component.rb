# frozen_string_literal: true

module Common
  class BadgeComponent < ViewComponent::Base
    def initialize(level: :default)
      @level = level
    end

    private

    attr_reader :level

    LEVEL_CLASSES = {
      default: "bg-blue-50 text-blue-700 ring-blue-700/10",
      info: "bg-blue-50 text-blue-700 ring-blue-700/10",
      positive: "bg-green-50 text-green-700 ring-green-700/10",
      negative: "bg-yellow-50 text-yellow-700 ring-yellow-700/10",
      warning: "bg-red-50 text-red-700 ring-red-700/10",
      urgent: "bg-red-700 text-white ring-red-700/10",
    }.freeze
    def level_classes
      LEVEL_CLASSES.fetch(level.to_sym, LEVEL_CLASSES[:default])
    end
  end
end
