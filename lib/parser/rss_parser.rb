# frozen_string_literal: true

require 'active_support/all'
require 'nokogiri'

class RssParser < BaseParser
  def self.can_parse?(data)
    Nokogiri::XML(data).root&.name == 'rss'
  end

  def parse(data)
    feeds = []

    Hash.from_xml(data)['rss']['channel']['item'].each do |item|
      item[:enclosure] = {}
      enclosure = item.delete('enclosure') if item['enclosure']['url']

      item[:id] = item.delete('guid') if item['guid']
      item[:author] = item.delete('author') if item['author']
      item[:title] = item.delete('title') if item['title']
      item[:link] = item.delete('link') if item['link']
      item[:description] = item.delete('description') if item['description']
      item[:published] = item.delete('pubDate') if item['pubDate']
      item[:category] = item.delete('category') if item['category']
      item[:enclosure][:url] = enclosure['url']
      item[:enclosure][:type] = enclosure['type']
      item[:enclosure][:length] = enclosure['length']

      feeds << item
    end

    feeds
  end
end
