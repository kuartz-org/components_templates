# frozen_string_literal: true

module Common
  class ButtonToComponent < LinkComponent
    slim_template <<~SLIM
      = button_to path, **options do
        = content
    SLIM

    def initialize(path, level: :secondary, **options)
      @level = level
      @path = path
      @options = options
    end
  end
end
