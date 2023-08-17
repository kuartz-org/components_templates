# frozen_string_literal: true

module Common
  class DropdownComponent < ViewComponent::Base
    renders_many :action_groups, "ActionGroupComponent"

    class ActionGroupComponent < ViewComponent::Base
      renders_many :actions, "ActionComponent"

      class ActionComponent < ViewComponent::Base
        def initialize(name:, href:)
          @name = name
          @href = href
        end

        private

        attr_reader :name, :href
      end
    end
  end
end
