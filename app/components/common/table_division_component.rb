# frozen_string_literal: true

module Common
  class TableDivisionComponent < ViewComponent::Base
    def initialize(*selected_options, **options)
      super
      @selected_options = selected_options

      options.assert_valid_keys(:class, :link_to, :id)
      @options = options
    end

    private

    attr_reader :selected_options, :options

    OPTIONS = {
      text_center: "text-center",
      text_right: "text-right",
      first_col: "pl-4 pr-3 font-medium text-gray-900 sm:pl-0"
    }.freeze
    def optional_classes
      OPTIONS.fetch_values(*selected_options).join(" ").tap do |classes|
        classes << " #{options[:class]}" if options[:class].present?
      end
    end

    def link_path
      options[:link_to]
    end

    def link?
      link_path.present?
    end

    def id
      options[:id]
    end
  end
end
