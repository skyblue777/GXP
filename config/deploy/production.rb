set :branch, 'master'
set :stage, :production
set :rails_env, :production

autoscale 'green-x-production-1483980824-WebServerAutoScaleGroup-5P0GRI1ATQI2', user: 'apps', roles: [:app, :web, :db]
