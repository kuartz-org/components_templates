# frozen_string_literal: true

module Common
  class CardComponent < ViewComponent::Base
    def initialize(title: nil, icon: nil, classes: nil)
      @title = title
      @icon = icon
      @classes = classes
    end

    private

    attr_reader :title, :icon, :classes
  end
end
