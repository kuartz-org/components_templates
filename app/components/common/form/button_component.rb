# frozen_string_literal: true

module Common
  module Form
    class ButtonComponent < ViewComponent::Base
      slim_template <<~SLIM
        = button_tag **html_options do
          = content
      SLIM

      def initialize(level: :secondary, **html_options)
        @level = level
        @html_options = html_options
      end

      private

      attr_reader :level

      LEVEL_CLASSES = {
        primary: <<~TXT.squish,
          rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500
          focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2
          focus-visible:outline-indigo-600
        TXT
        danger: <<~TXT.squish,
          rounded-md bg-red-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-red-500
          focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2
          focus-visible:outline-red-600
        TXT
        secondary: <<~TXT.squish,
          rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm
          ring-1 ring-inset ring-gray-300 hover:bg-gray-50
        TXT

      }.freeze
      def level_classes
        LEVEL_CLASSES[level]
      end

      def html_options
        @html_options.stringify_keys!

        @html_options.tap { |options| options["class"] = [options["class"], level_classes].uniq.compact.join(" ") }
      end
    end
  end
end