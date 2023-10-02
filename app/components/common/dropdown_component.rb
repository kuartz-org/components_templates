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
            **options,
            class: "w-full text-left text-slate-700 px-4 py-2 text-sm hover:bg-slate-100",
            role: "menuitem",
            tabindex: "-1"
        SLIM

        def initialize(name:, action_path: "", **options)
          @name = name
          @action_path = action_path
          @options = options
        end

        private

        attr_reader :name, :action_path, :options
      end

      class TextComponent < ViewComponent::Base
        slim_template <<~SLIM
          .w-full.text-left.text-slate-900.px-4.py-2.text-sm.font-medium
            = content
        SLIM
      end
    end

    def initialize(pop_direction: :right)
      @pop_direction = pop_direction
    end

    private

    attr_reader :pop_direction

    POP_DIRECTIONS = {
      right: "origin-top-right right-0",
      left: "origin-top-left left-0"
    }.freeze
    def pop_direction_class
      POP_DIRECTIONS[pop_direction.to_sym]
    end
  end
end
