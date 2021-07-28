# frozen_string_literal: true

class Parser
  def self.find(data)
    [RssParser, AtomParser, JsonParser].find { |parser| parser.can_parse?(data) }
  end
end
