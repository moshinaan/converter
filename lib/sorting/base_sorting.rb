class BaseSorting
  def self.can_sort?
    raise NotImplementedError, 'did not define #can_sort?'
  end

  def sort
    raise NotImplementedError, 'did not define #sort'
  end
end
