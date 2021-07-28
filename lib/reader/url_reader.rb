# frozen_string_literal: true

require 'net/http'

class UrlReader < BaseReader
  def self.can_read?(uri)
    url = URI.parse(uri)
    url.is_a?(URI::HTTP) || url.is_a?(URI::HTTPS)
  end

  def read(uri)
    Net::HTTP.get(URI.parse(uri))
  end
end
