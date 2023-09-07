# frozen_string_literal: true

module Common
  module Form
    class ButtonComponent < Common::LinkComponent
      slim_template <<~SLIM
        = button_tag **options do
          = content
      SLIM
    end
  end
end
