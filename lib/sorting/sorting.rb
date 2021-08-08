# frozen_string_literal: true

module Sorting
  def self.find(date)
    [AscSorting, DescSorting].find { |sorter| sorter.can_sort?(date) }
  end
end
