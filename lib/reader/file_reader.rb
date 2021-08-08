# frozen_string_literal: true

class FileReader < BaseReader
  def self.can_read?(file)
    File.file?(file)
  end

  def read(file)
    File.read(file)
  end
end
