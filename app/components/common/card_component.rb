# frozen_string_literal: true

module Common
  class CardComponent < ViewComponent::Base
    def initialize(title: nil, icon: nil, **options)
      @title = title
      @icon = icon
      @options = options
    end

    private

    attr_reader :title, :icon, :options

    def classes
      options[:class]
    end
  end
end
