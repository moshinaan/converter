# frozen_string_literal: true

require_relative '../test_helper'

class TestParser < Minitest::Test
  def test_rss_parser
    output_format = 'rss'

    reader = FileReader.new
    data = reader.read('test/fixtures/rss_file')

    parser = RssParser.new
    feeds =  parser.parse(data)
    converter = RssConverter.new
    converter.convert(feeds)

    assert RssConverter.can_convert?(output_format)

    output_data = File.read('./tmp/rss.txt')
    assert Nokogiri::XML(output_data).root&.name == 'rss'
  end

  def test_atom_parser
    output_format = 'atom'

    reader = FileReader.new
    data = reader.read('test/fixtures/rss_file')

    parser = RssParser.new
    feeds =  parser.parse(data)
    converter = AtomConverter.new
    converter.convert(feeds)

    assert AtomConverter.can_convert?(output_format)

    output_data = File.read('./tmp/atom.txt')
    assert Nokogiri::XML(output_data).root&.name == 'feed'
  end

  def test_json_parser
    output_format = 'json'

    reader = FileReader.new
    data = reader.read('test/fixtures/rss_file')

    parser = RssParser.new
    feeds =  parser.parse(data)
    converter = JsonConverter.new
    converter.convert(feeds)

    assert JsonConverter.can_convert?(output_format)

    output_data = File.read('./tmp/json.txt')
    assert JSON.parse(output_data).instance_of?(Hash)
  end
end
