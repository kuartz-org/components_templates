# frozen_string_literal: true

module Common
  module Layout
    class NavComponent < ViewComponent::Base
      def initialize(links:)
        @links = links
      end

      private

      attr_reader :links

      def active_link_classes(link)
        return "border-green-500 text-green-600" if link[:active]

        "border-transparent text-slate-500 hover:border-slate-300 hover:text-slate-700"
      end
    end
  end
end
