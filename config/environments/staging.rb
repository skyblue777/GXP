require Rails.root.join('config', 'environments', 'production')

Rails.application.configure do
  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log
end
