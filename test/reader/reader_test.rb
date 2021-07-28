require_relative "../test_helper.rb"

class TestReader < Minitest::Test
  def test_file_reader
    reader = FileReader.new
    file = 'test/fixtures/rss_file'
    data = reader.read(file)

    assert FileReader.can_read?(file) == true
    assert data == File.read(file)
  end

  def test_url_reader
    reader = UrlReader.new
    uri = 'https://lenta.ru/rss/'
    data = reader.read(uri)

    assert UrlReader.can_read?(uri) == true
    assert data == Net::HTTP.get(URI.parse(uri))
  end
end
