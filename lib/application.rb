require_relative 'reader/reader.rb'
require_relative 'reader/base_reader.rb'
require_relative 'reader/file_reader.rb'
require_relative 'reader/url_reader.rb'
require_relative 'parser/parser.rb'
require_relative 'parser/base_parser.rb'
require_relative 'parser/rss_parser.rb'
require_relative 'parser/atom_parser.rb'
require_relative 'parser/json_parser.rb'
require_relative 'converter/converter.rb'
require_relative 'converter/base_converter'
require_relative 'converter/rss_converter'
require_relative 'converter/atom_converter'
require_relative 'converter/json_converter'
require_relative 'sorting/sorting'
require_relative 'sorting/base_sorting'
require_relative 'sorting/asc_sorting'
require_relative 'sorting/desc_sorting'
require_relative 'listener.rb'

require 'byebug'

class Application

end
