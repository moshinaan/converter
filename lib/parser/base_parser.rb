class BaseParser
  def self.can_parse?
    raise NotImplementedError, 'did not define #can_parse?'
  end

  def parse
    raise NotImplementedError, 'did not define #parse'
  end
end
