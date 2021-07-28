require_relative 'application'

options = Listener.listen(ARGV)

reader = Reader.find(options[:source])
data = reader.new.read(options[:source])

parser = Parser.find(data)
feeds = parser.parse(data)

if options[:sort].present?
  sorting = Sorting.find(feeds)
  feeds = sorting.sort(feeds)
end

converter = Converter.find(options[:format])
converter.convert(feeds)
