require 'active_support/all'
require 'nokogiri'

class AtomParser < BaseParser
  def self.can_parse?(data)
    Nokogiri::XML(data).root&.name == 'feed'
  end

  def parse(data)
    feeds = []

    Hash.from_xml(data)["feed"]["entry"].each do |entry|
      entry[:id] = entry.delete("id") if entry["id"]
      entry[:title] = entry.delete("title") if entry["title"]
      entry[:link] = entry["link"]["href"]
      entry[:description] = entry.delete("summary") if entry["summary"]
      entry[:published] = entry.delete("updated") if entry["updated"]

      entry.delete("link") if entry["link"]

      feeds << entry
    end

    feeds
  end
end
