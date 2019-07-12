# A helper module to decode JSON strings on the fly, or return nil
# if the provided value was not parsable.
module JsonHelper
  def decode_json(value)
    JSON.parse(value)
  rescue JSON::ParserError
    nil
  end
end
