Avocado::Config.configure do |config|
  config.url = 'http://<YOUR_STAGING_SERVER_URL>/api-docs/specs'
  config.headers = ['Authorization']
  config.document_if = -> { ENV['AVOCADO'] }
  config.json_path = Rails.root.join('..', '..', 'shared')
end