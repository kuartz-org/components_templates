# frozen_string_literal: true

module Common
  class DropdownComponent < ViewComponent::Base
    renders_many :lists, "ListComponent"

    class ListComponent < ViewComponent::Base
      renders_many :items, types: {
        link: "LinkComponent",
        button: "ButtonComponent",
        text: "TextComponent"
      }

      slim_template <<~SLIM
        .py-1 role="none"
          - items.each do |item|
            = item
      SLIM

      class LinkComponent < ViewComponent::Base
        slim_template <<~SLIM
          = link_to name, href,
            class: "text-slate-700 block px-4 py-2 text-sm hover:bg-slate-100",
            role: "menuitem",
            tabindex: "-1"
        SLIM

        def initialize(name:, href:)
          @name = name
          @href = href
        end

        private

        attr_reader :name, :href
      end

      class ButtonComponent < ViewComponent::Base
        slim_template <<~SLIM
          = button_to name, action_path,
            **method_attribute,
            class: "w-full text-left text-slate-700 px-4 py-2 text-sm hover:bg-slate-100",
            role: "menuitem",
            tabindex: "-1"
        SLIM

        def initialize(name:, action_path:, method: nil)
          @name = name
          @action_path = action_path
          @method = method
        end

        private

        attr_reader :name, :action_path, :method

        def method_attribute
          return {} if method.blank?

          { method: method }
        end
      end

      class TextComponent < ViewComponent::Base
        slim_template <<~SLIM
          .w-full.text-left.text-slate-900.px-4.py-2.text-sm.font-medium
            = content
        SLIM
      end
    end
  end
end
