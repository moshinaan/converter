require 'rss'

# frozen_string_literal: true

class AtomConverter < BaseConverter
  def self.can_convert?(output_format)
    output_format == 'atom'
  end

  def convert(feeds)
    File.open('./tmp/atom.txt', 'w') { |f| f.write atom_builder(build_feeds(feeds)) }
  end

  private

  def build_feeds(feeds)
    result = []

    id = 'default_id'
    title = 'default_title'
    link = 'default_link'
    summary = 'default_description'
    updated = 'default_pubDate'

    feeds.each do |item|
      rss_item = {}

      rss_item[:id] = item[:id].nil? ? id : item[:id]
      rss_item[:title] = item[:title].nil? ? title : item[:title]
      rss_item[:link] = item[:link].nil? ? link : item[:link]
      rss_item[:summary] = item[:description].nil? ? summary : item[:description]
      rss_item[:updated] = item[:published].nil? ? updated : item[:published]

      result << rss_item
    end

    result
  end

  def atom_builder(feeds)
    RSS::Maker.make('atom') do |maker|
      maker.channel.title = 'Example Feed'
      maker.channel.link = "href='http://example.org/'"
      maker.channel.updated = Time.now.to_s
      maker.channel.author = 'author'
      maker.channel.id = 'default id'

      feeds.each do |feed|
        maker.items.new_item do |item|
          item.id = feed[:id]
          item.title = feed[:title]
          item.link = feed[:link]
          item.summary = feed[:summary]
          item.updated = feed[:updated]
        end
      end
    end
  end
end
