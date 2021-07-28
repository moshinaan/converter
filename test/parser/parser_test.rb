# frozen_string_literal: true

require_relative '../test_helper'

class TestParser < Minitest::Test
  def test_rss_parser
    reader = FileReader.new
    data = reader.read('test/fixtures/rss_file')

    parser = RssParser.new
    feeds =  parser.parse(data)

    assert RssParser.can_parse?(data) == true
    assert feeds.instance_of?(Array)
    assert feeds.count == 200
  end

  def test_atom_parser
    reader = FileReader.new
    data = reader.read('test/fixtures/atom_file')

    parser = AtomParser.new
    feeds =  parser.parse(data)

    assert AtomParser.can_parse?(data) == true
    assert feeds.instance_of?(Array)
    assert feeds.count == 3
  end

  def test_json_parser
    reader = FileReader.new
    data = reader.read('test/fixtures/json_file')

    parser = JsonParser.new
    feeds = parser.parse(data)

    assert JsonParser.can_parse?(data) == true
    assert feeds.instance_of?(Array)
    assert feeds.count == 2
  end
end
