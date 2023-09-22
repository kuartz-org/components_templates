# frozen_string_literal: true

module Common
  module Form
    class ModalComponent < Common::LinkComponent
      def initialize(form:, title:, action_text: controller.t("submit"))
        @form = form
        @title = title
        @action_text = action_text
      end

      private

      attr_reader :form, :title, :action_text
    end
  end
end
