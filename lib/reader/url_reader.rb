require 'net/http'

class UrlReader < BaseReader
  def self.can_read?(uri)
    url = URI.parse(uri)
    url.kind_of?(URI::HTTP) || url.kind_of?(URI::HTTPS)
  end

  def read(uri)
    Net::HTTP.get(URI.parse(uri))
  end
end
