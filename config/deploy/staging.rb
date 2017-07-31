set :branch, 'develop'
set :stage, :staging
set :rails_env, :staging

server 'staging.greenxprize.com', user: 'apps', roles: [:app, :web, :db]
