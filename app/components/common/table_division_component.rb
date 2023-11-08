# frozen_string_literal: true

module Common
  class TableDivisionComponent < ViewComponent::Base
    def initialize(*selected_options, **options)
      super
      @selected_options = selected_options

      options.assert_valid_keys(:class, :link_to, :id, :title)
      @link_path = options.delete(:link_to)
      @options = options
    end

    private

    attr_reader :selected_options, :link_path, :options

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

    def link? = link_path.present?

    def html_attributes
      return options.deep_merge(class: "group-hover:bg-gray-100") if link?

      options.presence || { class: "_" } # options is empty hash, *html_attributes (in template) raise an error
    end
  end
end
