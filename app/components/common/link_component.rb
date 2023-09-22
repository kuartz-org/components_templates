# frozen_string_literal: true

module Common
  class LinkComponent < ViewComponent::Base
    slim_template <<~SLIM
      = link_to path, **options do
        = content
    SLIM

    def initialize(level: :secondary, **options)
      @level = level
      @path = options.delete(:path)
      @options = options
    end

    private

    attr_reader :level, :path

    GLOBAL_CLASSES = "text-sm font-semibold px-3 py-2 active:shadow-inner shadow-sm rounded-md".freeze

    LEVEL_CLASSES = {
      primary: <<~TXT.squish,
        text-white bg-indigo-600 hover:bg-indigo-500
        focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2
        focus-visible:outline-indigo-600
      TXT
      danger: <<~TXT.squish,
        text-white bg-red-600 hover:bg-red-500
        focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2
        focus-visible:outline-red-600
      TXT
      secondary: <<~TXT.squish,
        text-gray-900 bg-white hover:bg-gray-50
        ring-1 ring-inset ring-gray-300
      TXT
    }.freeze
    def level_classes
      LEVEL_CLASSES[level]
    end

    def options
      @options.stringify_keys!

      @options.tap { |opt| opt["class"] = [opt["class"], GLOBAL_CLASSES, level_classes].uniq.compact.join(" ") }
    end
  end
end
