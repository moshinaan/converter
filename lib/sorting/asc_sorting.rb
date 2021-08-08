# frozen_string_literal: true

class AscSorting < BaseSorting
  def self.can_sort?(sort)
    sort.upcase == 'ASC'
  end

  def sort(data)
    data.sort_by { |feed| feed[:published] }
  end
end
