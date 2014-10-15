# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'Boostrapers'
set :repo_url, 'git@github.com:tectual/btsprs.git'
set :branch, 'master'
set :deploy_via, :remote_cache

set :deploy_to, '/var/www/bootstrapers.ir'
set :keep_releases, 5

set :linked_files, %w{config/database.yml config/defaults.yml config/secrets.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

#set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
