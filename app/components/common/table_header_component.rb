# frozen_string_literal: true

module Common
  class TableHeaderComponent < ViewComponent::Base
    def initialize(*selected_options, small: false)
      super
      @selected_options = selected_options
      @small = small
    end

    private

    attr_reader :selected_options, :small

    OPTIONS = {
      text_right: "text-right",
      first_col: "pl-4 font-semibold text-gray-900 sm:pl-0",
      no_padding: "!p-0"
    }.freeze
    def optional_classes
      OPTIONS.fetch_values(*selected_options).join(" ")
    end
  end
end
