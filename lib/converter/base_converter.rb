# frozen_string_literal: true

class BaseConverter
  def self.can_convert?
    raise NotImplementedError, 'did not define #can_convert?'
  end

  def convert
    raise NotImplementedError, 'did not define #convert'
  end
end
