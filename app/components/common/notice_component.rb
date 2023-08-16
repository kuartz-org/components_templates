# frozen_string_literal: true

module Common
  class NoticeComponent < ViewComponent::Base
    def initialize(title:, level: :default)
      @title = title
      @level = level
    end

    private

    attr_reader :title, :level

    LEVEL_BACKGROUNDS = {
      default: "bg-gray-50",
      caution: "bg-yellow-50",
      critical: "bg-red-50"
    }.freeze
    def level_background
      LEVEL_BACKGROUNDS[level]
    end

    LEVEL_ICONS = {
      default: "fa-solid fa-square-info text-gray-500",
      caution: "fa-solid fa-square-info text-yellow-600",
      critical: "fa-solid fa-triangle-exclamation text-red-600"
    }.freeze
    def level_icon
      LEVEL_ICONS[level]
    end
  end
end
