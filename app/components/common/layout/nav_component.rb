# frozen_string_literal: true

module Common
  module Layout
    class NavComponent < ViewComponent::Base
      renders_many :links, "LinkComponent"

      class LinkComponent < ViewComponent::Base
        def initialize(name:, href:, active: false)
          @name = name
          @href = href
          @active = active
        end

        def call
          link_to name, href, class: "whitespace-nowrap border-b-2 py-2 px-1 font-medium text-sm #{active_link_classes}"
        end

        private

        attr_reader :name, :href, :active

        def active_link_classes
          return "border-green-500 text-green-600" if active

          "border-transparent text-slate-500 hover:border-slate-300 hover:text-slate-700"
        end
      end
    end
  end
end
