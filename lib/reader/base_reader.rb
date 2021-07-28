require 'byebug'

class BaseReader
  def self.can_read?
    raise NotImplementedError, 'did not define #can_read?'
  end

  def read
    raise NotImplementedError, 'did not define #read'
  end
end
