# frozen_string_literal: true

# usage:
# = render Common::TableComponent.new do |table|
#   = table.with_header(:first_col).with_content("id")
#   = table.with_header(:text_right).with_content("value")

#   - @items.each do |item|
#     - table.with_row do |row|
#       = row.with_cell(:first_col).with_content(item.id)
#       = row.with_cell(:text_right).with_content(item.value)
module Common
  class TableComponent < ViewComponent::Base
    renders_many :headers, TableHeaderComponent
    renders_many :rows, "TableRowComponent"

    class TableRowComponent < ViewComponent::Base
      renders_many :cells, ->(*selected_options, **options) do
        TableDivisionComponent.new(*selected_options, **options.merge(cell_params))
      end

      slim_template <<~SLIM
        tr.group
          - cells.each do |cell|
            = cell
      SLIM

      def initialize(link_to: nil)
        @link_to = link_to
      end

      private

      attr_reader :link_to

      def cell_params
        link_to.present? ? { link_to: link_to } : {}
      end
    end
  end
end
