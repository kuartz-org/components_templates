# frozen_string_literal: true

module Common
  class ButtonToComponent < LinkComponent
    slim_template <<~SLIM
      = button_to nil, **options do
        = content
    SLIM
  end
end
