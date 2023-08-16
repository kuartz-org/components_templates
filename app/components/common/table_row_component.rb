# frozen_string_literal: true

module Common
  class TableRowComponent < ViewComponent::Base
    renders_many :cells, TableDivisionComponent
  end
end
