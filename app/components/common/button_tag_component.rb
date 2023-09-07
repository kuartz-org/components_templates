# frozen_string_literal: true

module Common
  class ButtonTagComponent < LinkComponent
    slim_template <<~SLIM
      = button_tag type: :button, **options do
        = content
    SLIM
  end
end
