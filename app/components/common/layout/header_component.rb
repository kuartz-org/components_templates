# frozen_string_literal: true

module Common
  module Layout
    class HeaderComponent < ViewComponent::Base
      def initialize(brand:)
        @brand = brand
      end

      private

      attr_reader :brand
    end
  end
end
