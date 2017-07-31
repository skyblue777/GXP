require File.expand_path('../environment',  __FILE__)

set :application, 'green-x'
set :deploy_user, 'apps'
set :repo_url, 'git@bitbucket.org:metova/green-x-web.git'
set :deploy_to, "/apps/#{fetch(:application)}"
set :ssh_options, { forward_agent: true }
set :keep_releases, 3
set :pty, false

set :rbenv_type, :user
set :rbenv_ruby, -> { `cat .ruby-version`.strip }

set :linked_files, %w{config/unicorn.rb config/application.yml}

set :sidekiq_pid, -> { File.join(shared_path, 'pids', 'sidekiq.pid') }
set :unicorn_pid, -> { File.join(shared_path, 'pids', 'unicorn.pid') }
set :unicorn_config_path, -> { File.join(current_path, 'config', 'unicorn.rb') }

set :aws_access_key_id,     ENV['AWS_ACCESS_KEY_ID']
set :aws_secret_access_key, ENV['AWS_SECRET_ACCESS_KEY']

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  after 'deploy:migrate', 'deploy:seed'
  after :publishing, :restart
end
