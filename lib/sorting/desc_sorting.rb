# frozen_string_literal: true

class DescSorting < BaseSorting
  def self.can_sort?(sort)
    sort.upcase == 'DESC'
  end

  def sort(data)
    data.sort_by { |feed| feed[:published] }.reverse
  end
end
