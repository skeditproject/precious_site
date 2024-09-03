server '3.111.244.34', user: 'deploy', port: 22, roles: [:web, :app, :db], primary: true
set :stage,         :production
set :branch,        :main
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
