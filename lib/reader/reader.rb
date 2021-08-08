# frozen_string_literal: true

module Reader
  def self.find(data_path)
    [FileReader, UrlReader].find { |reader| reader.can_read?(data_path) }
  end
end
