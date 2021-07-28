require 'optparse'

class Listener
  def self.listen(args)
    options = {}

    opts = OptionParser.new do |opts|
      opts.on('-i', '--input SOURCE', 'The source for input items') do |source|
        options[:source] = source
      end
      opts.on('-o', '--output FORMAT', 'Result format type. atom, rss or json') do |format|
        options[:format] = format
      end
      opts.on('-s', '--sort SORTING', 'Sort feeds by times. asc or desc') do |sorting|
        options[:sort] = sorting
      end
      opts.on('-h', '--help', 'Show help message') do ||
        puts opts
      end
    end

    opts.parse(args)

    options
  end
end
