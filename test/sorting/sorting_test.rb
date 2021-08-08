# frozen_string_literal: true

require_relative '../test_helper'

class TestSorting < Minitest::Test
  def test_asc_sorting
    sort = 'asc'

    assert AscSorting.can_sort?(sort) == true

    reader = FileReader.new
    parser = RssParser.new
    data = parser.parse(reader.read('test/fixtures/rss_file'))

    sorter = AscSorting.new
    assert sorter.min(data)[:published] == 'Sat, 17 Jul 2021 13:46:00 +0300'
  end

  def test_desc_sorting
    sort = 'desc'

    assert DescSorting.can_sort?(sort) == true

    reader = FileReader.new
    parser = RssParser.new
    data = parser.parse(reader.read('test/fixtures/rss_file'))

    sorter = DescSorting.new
    assert sorter.min(data)[:published] == 'Sun, 18 Jul 2021 19:35:00 +0300'
  end
end
