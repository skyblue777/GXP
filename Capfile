# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

# require 'capistrano/rvm'
require 'capistrano/rbenv'
require 'capistrano/rails'
require 'capistrano3/unicorn'
require 'capistrano/sidekiq'

require 'elbas/capistrano'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
