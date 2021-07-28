class Converter
  def self.find(output_format)
    [RssConverter, AtomConverter, JsonConverter].find { |converter| converter.can_convert?(output_format) }
  end
end
