module JSONHelper
  def json
    _json = JSON[response.body]
    case _json
    when Array
      _json.map(&:with_indifferent_access)
    when Hash
      _json.with_indifferent_access
    else
      _json
    end
  end
end

RSpec.configure do |config|
  config.include JSONHelper
end