# frozen_string_literal: true

module Common
  class TableComponentPreview < ViewComponent::Preview
    def default
      items = [
        OpenStruct.new(id: 1, label: "label 1", value: 1),
        OpenStruct.new(id: 2, label: "label 2", value: 2),
        OpenStruct.new(id: 3, label: "label 3", value: 3),
      ]

      render_with_template(locals: { items: items })
    end

    def with_link
      items = [
        OpenStruct.new(id: 1, label: "label 1", value: 1),
        OpenStruct.new(id: 2, label: "label 2", value: 2),
        OpenStruct.new(id: 3, label: "label 3", value: 3),
      ]

      render_with_template(locals: { items: items })
    end
  end
end
