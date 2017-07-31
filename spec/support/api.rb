RSpec.configure do |config|
  config.before(:each) do
    # Automatically set the Accept header to JSON if you're describing a controller in the Api namespace
    if described_class && described_class.name =~ /Api|API/
      @request.env['HTTP_ACCEPT'] = 'application/json'
    end
  end
end