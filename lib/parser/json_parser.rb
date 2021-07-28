require 'json'

class JsonParser < BaseParser
  def self.can_parse?(data)
    JSON.parse(data).class == Hash
  end

  def parse(data)
    feeds = []

    JSON.parse(data)["items"].each do |item|
      item[:id] = item.delete("id") if item["id"]
      item[:title] = item.delete("title") if item["title"]
      item[:link] = item.delete("url") if item["url"]
      item[:description] = item.delete("content_html") if item["content_html"]
      item[:published] = item.delete("date_published") if item["date_published"]

      feeds << item
    end

    feeds
  end
end
