require 'rss'

class RssConverter < BaseConverter
  def self.can_convert?(output_format)
    output_format == 'rss'
  end

  def convert(feeds)
    File.open('./tmp/rss.txt', 'w') { |f| f.write rss_builder(build_feeds(feeds)) }
  end

  private

  def build_feeds(feeds)
    result = []

    guid = 'default_id'
    author = 'default_author'
    title = 'default_title'
    link = 'default_link'
    description = 'default_description'
    pubDate = 'default_pubDate'
    enclosure_url = 'default_enclosure url'
    enclosure_type = 'default_enclosure url'
    enclosure_length = 'default length'
    category = 'default_category'

    feeds.each do |item|
      rss_item = {}
      rss_item[:enclosure] = {}

      rss_item[:guid] = item[:id].nil? ? guid : item[:id]
      rss_item[:author] = item[:author].nil? ? author : item[:author]
      rss_item[:title] = item[:title].nil? ? title : item[:title]
      rss_item[:link] = item[:link].nil? ? link : item[:link]
      rss_item[:description] = item[:description].nil? ? description : item[:description]
      rss_item[:pubDate] = item[:published].nil? ? pubDate : item[:published]
      rss_item[:enclosure][:url] = item[:enclosure][:url].nil? ? enclosure_url : item[:enclosure][:url]
      rss_item[:enclosure][:type] = item[:enclosure][:type].nil? ? enclosure_type : item[:enclosure][:type]
      rss_item[:enclosure][:length] = item[:enclosure][:length].nil? ? enclosure_length : item[:enclosure][:length]
      rss_item[:category] = item[:category].nil? ? category : item[:category]

      result << rss_item
    end

    result
  end

  def rss_builder(feeds)
    RSS::Maker.make('2.0') do |maker|
      maker.channel.language = 'ru'
      maker.channel.title = 'Example Feed'
      maker.channel.description = 'Example description'
      maker.channel.link = 'https://www.ruby-lang.org/en/feeds/news.rss'

      feeds.each do |feed|
        maker.items.new_item do |item|
          item.guid.content = feed[:guid]
          item.author = feed[:author]
          item.title = feed[:title]
          item.link = feed[:link]
          item.description = feed[:description]
          item.pubDate = feed[:pubDate]
          item.enclosure.url = feed[:enclosure][:url]
          item.enclosure.type = feed[:enclosure][:type]
          item.enclosure.length = feed[:enclosure][:length]
        end
      end
    end
  end
end
