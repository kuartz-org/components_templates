# frozen_string_literal: true

module Common
  class BreadcrumbComponent < ViewComponent::Base
    renders_many :items, "ItemComponent"

    class ItemComponent < ViewComponent::Base
      slim_template <<~SLIM
        li.group
          .flex.items-center.text-sm.font-medium.text-gray-500.space-x-4.group-first:-ml-4
            i.fa-solid.fa-chevron-right.fa-xs.group-first:hidden
            div = content
      SLIM
    end
  end
end
