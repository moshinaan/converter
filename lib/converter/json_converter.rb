require 'json'

class JsonConverter < BaseConverter
  def self.can_convert?(output_format)
    output_format == 'json'
  end

  def convert(feeds)
    File.open('./tmp/json.txt', 'w') { |f| f.write json_builder(build_feeds(feeds)) }
  end

  private

  def build_feeds(feeds)
    result = []

    id = 'default_id'
    title = 'default_title'
    url = 'default_link'
    content_html = 'default_description'
    date_published = 'default_date_published'

    feeds.each do |item|
      rss_item = {}

      rss_item[:id] = item[:id].nil? ? id : item[:id]
      rss_item[:title] = item[:title].nil? ? title : item[:title]
      rss_item[:url] = item[:link].nil? ? url : item[:link]
      rss_item[:content_html] = item[:description].nil? ? content_html : item[:description]
      rss_item[:date_published] = item[:published].nil? ? date_published : item[:published]

      result << rss_item
    end

    result
  end

  def json_builder(feeds)
    json_feeds = {}
    json_feeds[:items] = []

    json_feeds[:version] = 'https://jsonfeed.org/version/1'
    json_feeds[:title] = 'JSON Feed'
    json_feeds[:icon] =  'https://micro.blog/jsonfeed/avatar.jpg'
    json_feeds[:home_page_url] = 'https://www.jsonfeed.org/'
    json_feeds[:feed_url] = 'https://www.jsonfeed.org/feed.json'
    json_feeds[:items] = feeds

    json_feeds.to_json
  end
end
