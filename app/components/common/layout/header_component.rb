# frozen_string_literal: true

module Common
  module Layout
    class HeaderComponent < ViewComponent::Base
      def initialize(brand:, image: nil)
        @brand = brand
        @image = image
      end

      private

      attr_reader :brand, :image
    end
  end
end
