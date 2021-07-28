# frozen_string_literal: true

class Sorting
  def self.find(date)
    [AscSorting, DescSorting].find { |sorter| sorter.can_sort?(date) }
  end
end
